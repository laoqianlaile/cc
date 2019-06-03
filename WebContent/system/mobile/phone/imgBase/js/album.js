(function($) {
	var CLS_SELECTED = "album-carousel-thumb-selected", CLS_HIDE = "hide", PX = "px";
	jQuery.Album = function(config) {
		this.setting = {
			root : $("#album-image-md"),
			image : $("#album-image"),
			title : $("#album-image-ft"),
			btnDownload : $("#album-download"),
			navBlock : $("#album-image-nav"),
			btnPrev : $("#album-image-btn-prev"),
			btnNext : $("#album-image-btn-next"),
			prevBlock : $("#album-image-nav-left-block"),
			nextBlock : $("#album-image-nav-right-block"),
			overlay : $("#album-image-loading-overlay"),
			Carousel : new jQuery.Carousel({
				root : '#album-carousel',
				carousel : '#album-carousel-list',
				pages : {
					prev : '#album-carousel-btn-prev',
					next : '#album-carousel-btn-next'
				},
				direction : 'H'
			}),
			curIndex : 0,
			maxWidth : 1000,
			maxHeight : 750
		};
		$.extend(this.setting, config);
		this.selectedItem = null;
		this.currentItem = null;
		this.isloading = false;
		this.init();
		return this;
	};
	jQuery.Album.prototype = {
		init : function() {
			this.select().change().bindEvent();
			return this;
		},
		change : function() {
			var Album = this, currentItem = Album.currentItem, image = Album
					.getImage(), title = Album.getTitle(), overlay = Album
					.getOverlay(), btnDownload = Album.getBtnDownload(), src = currentItem
					.find("a:first").attr("href"), alt = currentItem.find(
					"img:first").attr("alt"), percent = 0, preloader = new Image();
			overlay.removeClass(CLS_HIDE);
			this.isloading = true;
			preloader.src = src;
			$(preloader)
					.load(
							function(evt) {
								var width = preloader.width, height = preloader.height, maxWidth = Album
										.getMaxWidth(), maxHeight = Album
										.getMaxHeight();
								percent = width / height;
								if (width > maxWidth) {
									width = maxWidth;
									height = width / percent;
									if (height > maxHeight) {
										percent = maxHeight / height;
										width = width * percent;
										height = maxHeight;
									}
								} else {
									if (width <= maxWidth) {
										if (height > maxHeight) {
											percent = maxHeight / height;
											width = width * percent;
											height = maxHeight;
										}
									}
								}
								image.animate({
									"width" : width + PX,
									"height" : height + PX,
									"margin-left" : -(width / 2) + PX,
									"margin-top" : -(height / 2) + PX
								}, 500, function() {
									image.attr({
										"src" : src,
										"alt" : alt
									});
									title.html(alt);
									btnDownload.attr("href", src);
									overlay.addClass(CLS_HIDE);
									Album.isloading = false;
								});
							});
			return this;
		},
		select : function() {
			var selectedItem = this.selectedItem, currentItem = null, items = this
					.getItems(), curIndex = this.getCurrentIndex();
			if (selectedItem) {
				selectedItem.removeClass(CLS_SELECTED);
			}
			currentItem = this.currentItem = $(items[curIndex]);
			currentItem.addClass(CLS_SELECTED);
			this.selectedItem = currentItem;
			return this;
		},
		prev : function() {
			this.setCurrentIndex(this.getCurrentIndex() - 1);
			if (this.getCurrentIndex() < 0) {
				this.setCurrentIndex(this.getLength() - 1).prevGroup();
			} else {
				if (this.getCurrentIndex() > 0) {
					if (this.getCurrentIndex() < this.getCurrentPage()
							* this.getItemsPrePage()) {
						this.prevGroup();
					}
				}
			}
			this.select().change();
			return this;
		},
		next : function() {
			this.setCurrentIndex(this.getCurrentIndex() + 1);
			if (this.getCurrentIndex() > this.getLength() - 1) {
				this.setCurrentIndex(0).nextGroup();
			} else {
				if (this.getCurrentPage() < this.getMaxPages()) {
					if (this.getCurrentIndex() > ((this.getCurrentPage() + 1) * this
							.getItemsPrePage()) - 1) {
						this.nextGroup();
					}
				}
			}
			this.select().change();
			return this;
		},
		prevGroup : function() {
			var Carousel = this.getCarousel();
			Carousel.prev();
			return this;
		},
		nextGroup : function() {
			var Carousel = this.getCarousel();
			Carousel.next();
			return this;
		},
		bindEvent : function() {
			var Album = this, root = Album.getRoot(), navBlock = Album
					.getNavBlock(), prevBlock = Album.getPrevBlock(), nextBlock = Album
					.getNextBlock(), btnPrev = Album.getBtnPrev(), btnNext = Album
					.getBtnNext(), items = Album.getItems();
			root.hover(function() {
				navBlock.removeClass(CLS_HIDE);
			}, function() {
				navBlock.addClass(CLS_HIDE);
			});
			prevBlock.click(function(evt) {
				Album.prev();
				evt.preventDefault();
				evt.stopPropagation();
			});
			nextBlock.click(function(evt) {
				Album.next();
				evt.preventDefault();
				evt.stopPropagation();
			});
			btnPrev.click(function(evt) {
				Album.prev();
				evt.preventDefault();
				evt.stopPropagation();
			});
			btnNext.click(function(evt) {
				Album.next();
				evt.preventDefault();
				evt.stopPropagation();
			});
			items.each(function(i, item) {
				$(item).click(function(evt) {
					if (!$(this).hasClass(CLS_SELECTED) && !Album.isLoading) {
						Album.setCurrentIndex(i).select().change();
					}
					evt.preventDefault();
					evt.stopPropagation();
				});
			});
			return this;
		},
		getRoot : function() {
			return $(this.setting.root);
		},
		getImage : function() {
			return $(this.setting.image);
		},
		getTitle : function() {
			return $(this.setting.title);
		},
		getBtnDownload : function() {
			return $(this.setting.btnDownload);
		},
		getNavBlock : function() {
			return $(this.setting.navBlock);
		},
		getPrevBlock : function() {
			return $(this.setting.prevBlock);
		},
		getNextBlock : function() {
			return $(this.setting.nextBlock);
		},
		getBtnPrev : function() {
			return $(this.setting.btnPrev);
		},
		getBtnNext : function() {
			return $(this.setting.btnNext);
		},
		getOverlay : function() {
			return $(this.setting.overlay);
		},
		getCarousel : function() {
			return this.setting.Carousel;
		},
		getCurrentPage : function() {
			var Carousel = this.getCarousel();
			return Carousel.setting.curPage;
		},
		setCurrentPage : function(page) {
			var Carousel = this.getCarousel();
			Carousel.setting.curPage = page;
			return this;
		},
		getMaxPages : function() {
			var Carousel = this.getCarousel();
			return Carousel.setting.maxPages;
		},
		getItemsPrePage : function() {
			var Carousel = this.getCarousel();
			return Carousel.setting.itemsPrePage;
		},
		getItems : function() {
			return this.getSamples();
		},
		getSamples : function() {
			var Carousel = this.getCarousel();
			return Carousel.setting.items;
		},
		getLength : function() {
			return this.getItems().length;
		},
		getCurrentIndex : function() {
			return this.setting.curIndex;
		},
		setCurrentIndex : function(i) {
			this.setting.curIndex = i;
			return this;
		},
		getMaxWidth : function() {
			return this.setting.maxWidth;
		},
		getMaxHeight : function() {
			return this.setting.maxHeight;
		}
	};
})(jQuery);
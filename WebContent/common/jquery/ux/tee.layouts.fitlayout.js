(function($){var opts={el:$("<div></div>"),items:[],draggable:{containment:"parent"},resizable:{},position:"center",droppableCls:"free-droppable",cmpCls:"jq-freelayout",droppableCmps:[]};Tee.createComponent.call(Tee.layouts,"FitLayout",opts,Tee.layouts.AutoLayout.prototype,{doItem:function(e){if(Tee.isCmp(e)){e.setStyle({width:"100%",zoom:1});if(e.setHeight){e.setHeight(this.el.height()-(e.weltHeight||75))}}},receiveItem:function(e){Tee.layouts.AutoLayout.prototype.receiveItem.apply(this,arguments);if(e.setHeight){e.setHeight(this.el.height()-(e.weltHeight||75))}}})})(jQuery);
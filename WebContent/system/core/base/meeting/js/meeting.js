
/*会议类型描述
 * 
 * 	0、	待批
	1、	已批准
	2、	进行中
	3、	未批准
	4、已结束
 *
 * 
 * */
var MEETING_STATUS_TYPE_DESC = ["待批" , "已批准" , "进行中"  , "未批准" , "已结束"];


/**
 * 获取会议室 ---  根据权限
 * @param 
 *
 */
function selectPostMeetRoom(){

	var url =   contextPath + "/meetRoomManage/selectPostMeetRoom.action";
	var para = {};
	var jsonRs = tools.requestJsonRs(url , para);
	if(jsonRs.rtState){
		return jsonRs.rtData;
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
}

/**
 * 获取所有会议室 、
 * @param 
 *
 */
function getAllRoom(){
	var url =   contextPath + "/meetRoomManage/getAllRoom.action";
	var para = {};
	var jsonRs = tools.requestJsonRs(url , para);
	if(jsonRs.rtState){
		return jsonRs.rtData;
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
}

/**
 * 查看会议申请详情
 * @param id
 */
function meetingRoomDetail(id){
	var url = contextPath + "/system/core/base/meeting/room/detail.jsp?sid=" + id ;
	bsWindow(url ,"查看会议室详情",{width:"1000",height:"330",buttons:
		 [{name:"关闭",classStyle:"btn-alert-gray"}]
	,submit:function(v,h){
		var cw = h[0].contentWindow;
		if(v=="修改"){
			
		}else if(v == "删除"){
			
		}else if(v=="关闭"){
			return true;
		}
	}});
}

function meetingRoomJBoxDetail(id){
	var url = contextPath + "/system/core/base/meeting/room/detail.jsp?sid=" + id ;
/*	top.$.jBox("iframe:"+url,
			{title:"查看会议室详情",width:500,height:400,buttons: {"关闭":true}});*/
	parent.bsWindow(url,"查看会议室详情",{width:"1000",height:"330",buttons:[{name:"关闭",classStyle:"btn-alert-gray"}],submit:function(v,h){
	    if(v=="关闭"){
			return true;
        }
  }
	});


}



/**
 * 查看会议申请详情
 * @param id
 */
function meetingDetail(id){
	var url = contextPath + "/system/core/base/meeting/personal/meetingdetail.jsp?showConfirmFlag=1&id=" + id ;
	bsWindow(url ,"查看会议详情",{width:"720",height:"360",buttons:
		 [{name:"关闭",classStyle:"modal-btn-close btn-alert-gray"}]
	,submit:function(v,h){
		var cw = h[0].contentWindow;
		if(v=="修改"){
			toAddOrUpdateMeeting(calEvents , view , calEvents ,calendar);
		}else if(v == "删除"){
			var isClose = false;
			//var submit = function (v, h, f) {
			var submit = function () {
			    //if (v == 'ok'){
			    	isClose = deleteCal(sid , calendar);
			    	if(isClose){
			    		//window.BSWINDOW.modal("hide");
			    		//getCalendar();
			    		$.MsgBox.Alert_auto('删除成功');
			    	}
			    	isClose =  true;
			    //}
			    isClose =  true; //close
			};
			//$.jBox.confirm("确定要删除吗？", "提示", submit);
			$.MsgBox.Confirm("提示", "确定删除所选记录,删除后将不可恢复！", submit);
			//return isClose;
		}else if(v=="关闭"){
			return true;
		}
	}});
}


function meetingJBoxDetail(id){
	var url = contextPath + "/system/core/base/meeting/personal/meetingdetail.jsp?id=" + id ;
	top.$.jBox("iframe:"+url,
			{title:"查看会议详情",width:700,height:500,buttons: {"关闭":true}});

}
/**
 * 查看会议申请详情
 * @param id
 */
function meetingRoomUseDetail(id){
	var url = contextPath + "/system/core/base/meeting/leader/meetUse.jsp" ;
	top.bsWindow(url ,"查看会议室使用情况",{width:"900",height:"400",buttons:
		 [{name:"关闭",classStyle:"btn-alert-gray"}]
	,submit:function(v,h){
		var cw = h[0].contentWindow;
		if(v=="修改"){
			
		}else if(v == "删除"){
			
		}else if(v=="关闭"){
			return true;
		}
	}});
}



/**
 * 是否确认参会
 */
function isConfirmFunc(meetingId){
	var confirmFlag = 0;
	var url =   contextPath + "/TeeMeetingAttendConfirmController/isConfirmFlag.action";
	var para = {meetingId:meetingId};
	var jsonRs = tools.requestJsonRs(url , para);
	if(jsonRs.rtState){
		confirmFlag =  jsonRs.rtData.confirmFlag;
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
	return confirmFlag;
}

/**
 * 参会签阅
 */
function updateReadFlagFunc(meetingId){
	var url =   contextPath + "/TeeMeetingAttendConfirmController/updateReadFlag.action";
	var para = {meetingId:meetingId};
	var jsonRs = tools.requestJsonRs(url , para);
	if(jsonRs.rtState){
	}else{
		$.MsgBox.Alert_auto(jsonRs.rtMsg);
	}
}

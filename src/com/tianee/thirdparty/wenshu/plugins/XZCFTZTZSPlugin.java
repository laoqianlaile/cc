package com.tianee.thirdparty.wenshu.plugins;

import java.util.Map;

import com.jacob.req.JacobRequest;
import com.jacob.req.JacobResponse;
import com.tianee.webframe.util.str.TeeUtility;
/**
 * 行政处罚听证通知书(17)
 * */
public class XZCFTZTZSPlugin extends TeeWenShuPlugin{

	@Override
	public String process(JacobRequest jacobRequest, String wordId,
			Map<String, String> data) {
//		data.put("页眉", "编码：222222222");
//		//文号文
//		data.put("文号文", "001");
//		//文号年
//		data.put("文号年", "2018");
//		//文号
//		data.put("文号", "1");
//		//当事人名称
//		data.put("当事人名称", "王小明");
//		//听证会时间
//		data.put("听证会时间", "2018年10月16日 20时20分");
//		//听证会地址
//		data.put("听证会地址", "北京");
//		//听证会案由
//		data.put("听证会案由", "针对XXX进行讨论");
//		//听证主持人
//		data.put("听证主持人", "小红");
//		//听证记录人
//		data.put("听证记录人", "小白");
//		//联系人
//		data.put("联系人", "小兰");
//		//联系电话
//		data.put("联系电话", "111111111");
//		//行政机关落款
//		data.put("行政机关落款", "中国人民法院");
//		//盖章时间
//		data.put("盖章时间", "2018年10月16日");
//		String img="iVBORw0KGgoAAAANSUhEUgAAAGgAAABcCAYAAACC9/AaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NjkxRTVBQzdEMDY3MTFFOEE0MTZCMjJGQjBEQzA5RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NjkxRTVBQzhEMDY3MTFFOEE0MTZCMjJGQjBEQzA5RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2OTFFNUFDNUQwNjcxMUU4QTQxNkIyMkZCMERDMDlFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2OTFFNUFDNkQwNjcxMUU4QTQxNkIyMkZCMERDMDlFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoHm0DAAABaWSURBVHja7F0HWFVl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";
//		//送达主办人签名
//		data.put("送达主办人签名", img);
//		//送达协办人签名
//		data.put("送达协办人签名", img);
//		//送达时间
//		data.put("送达时间", "2018年10月16日 20时20分");
//		//受送达人签名
//		data.put("受送达人签名", img);
//		//签收时间
//		data.put("签收时间", "2018年10月16日 20时20分");
//		//送达方式
//		data.put("送达方式", "速递");
//		//送达地点
//		data.put("送达地点", "北京海淀区");
		//送达主办人签名
		String zbrqm = data.get("送达主办人签名");
		data.remove("送达主办人签名");
		//送达协办人签名
		String xbrqm = data.get("送达协办人签名");
		data.remove("送达协办人签名");
		//受送达人签名
		String ssdrqm = data.get("受送达人签名");
		data.remove("受送达人签名");
				
		
		//套入书签
		JacobResponse response = jacobRequest.replaceBookmarks(wordId, data);
		String newWordId = response.fileId;//获取套完书签后的wordId
		
		//判断签名是否存在
		if(!TeeUtility.isNullorEmpty(zbrqm)){
			String scriptRun = "jacob.setBookMarksPicture(\"送达主办人签名\",\""+zbrqm+"\",6,-1,30)";
			response = jacobRequest.scriptRun(scriptRun, newWordId);
			newWordId = response.fileId;
		}
		
		if(!TeeUtility.isNullorEmpty(xbrqm)){
			String scriptRun = "jacob.setBookMarksPicture(\"送达协办人签名\",\""+xbrqm+"\",6,-1,30)";
			response = jacobRequest.scriptRun(scriptRun, newWordId);
			newWordId = response.fileId;
		}
		
		if(!TeeUtility.isNullorEmpty(ssdrqm)){
			String scriptRun = "jacob.setBookMarksPicture(\"受送达人签名\",\""+ssdrqm+"\",6,-1,30)";
			response = jacobRequest.scriptRun(scriptRun, newWordId);
			newWordId = response.fileId;
		}
		
		return newWordId;
	}

}

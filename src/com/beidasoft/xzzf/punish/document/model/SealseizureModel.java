package com.beidasoft.xzzf.punish.document.model;
import java.util.Map;

public class SealseizureModel {
	// 查封扣押决定书主键ID
    private String id;

    // 文书名称类型（查封、扣押）
    private String docNameType;

    // 文书区字
    private String docArea;

    // 文书年度
    private String docYear;

    // 文书序号
    private String docNum;

    // 文书号类型（查封、扣押）
    private String docNumType;

    // 当事人
    private String party;
    
    //当事人类型
    private String partyType;
    
    //负责人姓名
    private String leadingName;
    
    // 住所（住址）
    private String partyAddress;

    // 涉嫌行为
    private String cause;
    
    // 案由
    private String causeAction;

    // 出版管理条例或互联网管理条例（复选框单选）
    private String isPublishOrNet;

    // 场所或物品（复选框单选）
    private String placeOrGoods;

    // 处理决定类别
    private String processDecisionType;
    
    // 处理决定类别1
    private String processDecisionType1;
    
    // 处理决定类别2
    private String processDecisionType2;
    
    // 处理决定类别3
    private String processDecisionType3;

    // 查封期限起
    private String processDecisionDateStartStr;

    // 查封期限末
    private String processDecisionDateEndStr;

    // 人民政府ID
    private String govId;

    // 人民政府名称
    private String govName;

    // 部委ID
    private String ministriesId;

    // 部委名称
    private String ministriesName;

    // 市区ID
    private String areaId;

    // 市区名称
    private String areaName;

    // 执法主办人签名图片
    private String lawMajorSignatureBase64;

    // 执法主办人签名值
    private String lawMajorSignatureValue;

    // 执法主办人签名位置
    private String lawMajorSignaturePlace;

    // 执法主办人执法证号
    private String lawMajorCode;

    // 执法协办人签名图片
    private String lawMinorSignatureBase64;

    // 执法协办人签名值
    private String lawMinorSignatureValue;

    // 执法协办人签名位置
    private String lawMinorSignaturePlace;

    // 执法协办人执法证号
    private String lawMinorCode;

    // 物品清单文书区字
    private String docAreaGoods;

    // 物品清单文书年度
    private String docYearGoods;

    // 物品清单文书序号
    private String docNumGoods;

    // 行政机关落款和印章图片
    private String administrationBase64;

    // 行政机关落款和印章值
    private String administrationValue;

    // 行政机关落款和印章地址
    private String administrationPlace;

    // 行政机关落款和印章时间
    private String administrationDateStr;

    // 送达主办人签名图片
    private String deliverMajorSignatureBase64;

    // 送达主办人签名值
    private String deliverMajorSignatureValue;

    // 送达主办人签名位置
    private String deliverMajorSignaturePlace;

    // 送达协办人签名图片  
    private String deliverMinorSignatureBase64;

    // 送达协办人签名值
    private String deliverMinorSignatureValue;

    // 送达协办人签名位置
    private String deliverMinorSignaturePlace;

    // 送达时间
    private String deliveryTimeStr;

    // 受送达人签名或盖章图片
    private String receiverBase64;

    // 受送达人签名或盖章值
    private String receiverValue;

    // 受送达人签名或盖章位置
    private String receiverPlace;

    // 受送达人签名或盖章时间
    private String receiverDateStr;
    
    //是否备注
    private String isRemarks;
    
    //备注
    private String remarks;
    // 送达方式
    private String deliverType;

    // 送达地点
    private String deliverAddress;

    // 组织机构编号
    private String organsCode;

    // 组织机构名称
    private String organsName;

    // 附件地址
    private String enclosureAddress;

    // 执法办案唯一编号
    private String baseId;

    // 删除标记
    private String delFlg;

    // 执法环节ID
    private String lawLinkId;

    // 变更人ID
    private String updateUserId;

    // 变更人姓名
    private String updateUserName;

    // 变更时间
    private String updateTimeStr;

    // 送达方式
    private String deliveryType;

    // 送达地点
    private String deliveryPlace;
    
    
    //物品清单主表ID
    private String docArticlesId;
    
    //物品清单文号
    private String docArticlesName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDocNameType() {
		return docNameType;
	}

	public void setDocNameType(String docNameType) {
		this.docNameType = docNameType;
	}

	public String getDocArea() {
		return docArea;
	}

	public void setDocArea(String docArea) {
		this.docArea = docArea;
	}

	public String getProcessDecisionType1() {
		return processDecisionType1;
	}

	public void setProcessDecisionType1(String processDecisionType1) {
		this.processDecisionType1 = processDecisionType1;
	}

	public String getProcessDecisionType2() {
		return processDecisionType2;
	}

	public void setProcessDecisionType2(String processDecisionType2) {
		this.processDecisionType2 = processDecisionType2;
	}

	public String getProcessDecisionType3() {
		return processDecisionType3;
	}

	public void setProcessDecisionType3(String processDecisionType3) {
		this.processDecisionType3 = processDecisionType3;
	}

	public String getDocYear() {
		return docYear;
	}

	public void setDocYear(String docYear) {
		this.docYear = docYear;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public String getDocNumType() {
		return docNumType;
	}

	public void setDocNumType(String docNumType) {
		this.docNumType = docNumType;
	}

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}

	public String getPartyAddress() {
		return partyAddress;
	}

	public void setPartyAddress(String partyAddress) {
		this.partyAddress = partyAddress;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getCauseAction() {
		return causeAction;
	}

	public void setCauseAction(String causeAction) {
		this.causeAction = causeAction;
	}

	public String getIsPublishOrNet() {
		return isPublishOrNet;
	}

	public void setIsPublishOrNet(String isPublishOrNet) {
		this.isPublishOrNet = isPublishOrNet;
	}

	public String getPlaceOrGoods() {
		return placeOrGoods;
	}

	public void setPlaceOrGoods(String placeOrGoods) {
		this.placeOrGoods = placeOrGoods;
	}

	public String getProcessDecisionType() {
		return processDecisionType;
	}

	public void setProcessDecisionType(String processDecisionType) {
		this.processDecisionType = processDecisionType;
	}

	public String getProcessDecisionDateStartStr() {
		return processDecisionDateStartStr;
	}

	public void setProcessDecisionDateStartStr(String processDecisionDateStartStr) {
		this.processDecisionDateStartStr = processDecisionDateStartStr;
	}

	public String getProcessDecisionDateEndStr() {
		return processDecisionDateEndStr;
	}

	public void setProcessDecisionDateEndStr(String processDecisionDateEndStr) {
		this.processDecisionDateEndStr = processDecisionDateEndStr;
	}

	public String getGovId() {
		return govId;
	}

	public void setGovId(String govId) {
		this.govId = govId;
	}

	public String getGovName() {
		return govName;
	}

	public void setGovName(String govName) {
		this.govName = govName;
	}

	public String getMinistriesId() {
		return ministriesId;
	}

	public void setMinistriesId(String ministriesId) {
		this.ministriesId = ministriesId;
	}

	public String getMinistriesName() {
		return ministriesName;
	}

	public void setMinistriesName(String ministriesName) {
		this.ministriesName = ministriesName;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getLawMajorSignatureBase64() {
		return lawMajorSignatureBase64;
	}

	public void setLawMajorSignatureBase64(String lawMajorSignatureBase64) {
		this.lawMajorSignatureBase64 = lawMajorSignatureBase64;
	}

	public String getLawMajorSignatureValue() {
		return lawMajorSignatureValue;
	}

	public void setLawMajorSignatureValue(String lawMajorSignatureValue) {
		this.lawMajorSignatureValue = lawMajorSignatureValue;
	}

	public String getLawMajorSignaturePlace() {
		return lawMajorSignaturePlace;
	}

	public void setLawMajorSignaturePlace(String lawMajorSignaturePlace) {
		this.lawMajorSignaturePlace = lawMajorSignaturePlace;
	}

	public String getLawMajorCode() {
		return lawMajorCode;
	}

	public void setLawMajorCode(String lawMajorCode) {
		this.lawMajorCode = lawMajorCode;
	}

	public String getLawMinorSignatureBase64() {
		return lawMinorSignatureBase64;
	}

	public void setLawMinorSignatureBase64(String lawMinorSignatureBase64) {
		this.lawMinorSignatureBase64 = lawMinorSignatureBase64;
	}

	public String getLawMinorSignatureValue() {
		return lawMinorSignatureValue;
	}

	public void setLawMinorSignatureValue(String lawMinorSignatureValue) {
		this.lawMinorSignatureValue = lawMinorSignatureValue;
	}

	public String getLawMinorSignaturePlace() {
		return lawMinorSignaturePlace;
	}

	public void setLawMinorSignaturePlace(String lawMinorSignaturePlace) {
		this.lawMinorSignaturePlace = lawMinorSignaturePlace;
	}

	public String getLawMinorCode() {
		return lawMinorCode;
	}

	public void setLawMinorCode(String lawMinorCode) {
		this.lawMinorCode = lawMinorCode;
	}

	public String getDocAreaGoods() {
		return docAreaGoods;
	}

	public String getLeadingName() {
		return leadingName;
	}

	public void setLeadingName(String leadingName) {
		this.leadingName = leadingName;
	}

	public void setDocAreaGoods(String docAreaGoods) {
		this.docAreaGoods = docAreaGoods;
	}

	public String getDocYearGoods() {
		return docYearGoods;
	}

	public void setDocYearGoods(String docYearGoods) {
		this.docYearGoods = docYearGoods;
	}

	public String getDocNumGoods() {
		return docNumGoods;
	}

	public void setDocNumGoods(String docNumGoods) {
		this.docNumGoods = docNumGoods;
	}

	public String getAdministrationBase64() {
		return administrationBase64;
	}

	public void setAdministrationBase64(String administrationBase64) {
		this.administrationBase64 = administrationBase64;
	}

	public String getAdministrationValue() {
		return administrationValue;
	}

	public void setAdministrationValue(String administrationValue) {
		this.administrationValue = administrationValue;
	}

	public String getAdministrationPlace() {
		return administrationPlace;
	}

	public void setAdministrationPlace(String administrationPlace) {
		this.administrationPlace = administrationPlace;
	}

	public String getDeliverMajorSignatureBase64() {
		return deliverMajorSignatureBase64;
	}

	public void setDeliverMajorSignatureBase64(String deliverMajorSignatureBase64) {
		this.deliverMajorSignatureBase64 = deliverMajorSignatureBase64;
	}

	public String getDeliverMajorSignatureValue() {
		return deliverMajorSignatureValue;
	}

	public void setDeliverMajorSignatureValue(String deliverMajorSignatureValue) {
		this.deliverMajorSignatureValue = deliverMajorSignatureValue;
	}

	public String getDeliverMajorSignaturePlace() {
		return deliverMajorSignaturePlace;
	}

	public void setDeliverMajorSignaturePlace(String deliverMajorSignaturePlace) {
		this.deliverMajorSignaturePlace = deliverMajorSignaturePlace;
	}

	public String getDeliverMinorSignatureBase64() {
		return deliverMinorSignatureBase64;
	}

	public void setDeliverMinorSignatureBase64(String deliverMinorSignatureBase64) {
		this.deliverMinorSignatureBase64 = deliverMinorSignatureBase64;
	}

	public String getPartyType() {
		return partyType;
	}

	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}

	public String getDeliverMinorSignatureValue() {
		return deliverMinorSignatureValue;
	}

	public void setDeliverMinorSignatureValue(String deliverMinorSignatureValue) {
		this.deliverMinorSignatureValue = deliverMinorSignatureValue;
	}

	public String getDeliverMinorSignaturePlace() {
		return deliverMinorSignaturePlace;
	}

	public void setDeliverMinorSignaturePlace(String deliverMinorSignaturePlace) {
		this.deliverMinorSignaturePlace = deliverMinorSignaturePlace;
	}

	public String getReceiverBase64() {
		return receiverBase64;
	}

	public void setReceiverBase64(String receiverBase64) {
		this.receiverBase64 = receiverBase64;
	}

	public String getReceiverValue() {
		return receiverValue;
	}

	public void setReceiverValue(String receiverValue) {
		this.receiverValue = receiverValue;
	}

	public String getReceiverPlace() {
		return receiverPlace;
	}

	public void setReceiverPlace(String receiverPlace) {
		this.receiverPlace = receiverPlace;
	}


	public String getDeliverType() {
		return deliverType;
	}

	public void setDeliverType(String deliverType) {
		this.deliverType = deliverType;
	}

	public String getDeliverAddress() {
		return deliverAddress;
	}

	public void setDeliverAddress(String deliverAddress) {
		this.deliverAddress = deliverAddress;
	}

	public String getOrgansCode() {
		return organsCode;
	}

	public void setOrgansCode(String organsCode) {
		this.organsCode = organsCode;
	}

	public String getOrgansName() {
		return organsName;
	}

	public void setOrgansName(String organsName) {
		this.organsName = organsName;
	}

	public String getEnclosureAddress() {
		return enclosureAddress;
	}

	public void setEnclosureAddress(String enclosureAddress) {
		this.enclosureAddress = enclosureAddress;
	}

	public String getBaseId() {
		return baseId;
	}

	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}

	public String getDelFlg() {
		return delFlg;
	}

	public void setDelFlg(String delFlg) {
		this.delFlg = delFlg;
	}

	public String getLawLinkId() {
		return lawLinkId;
	}

	public void setLawLinkId(String lawLinkId) {
		this.lawLinkId = lawLinkId;
	}

	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getUpdateUserName() {
		return updateUserName;
	}

	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}
	
	public String getAdministrationDateStr() {
		return administrationDateStr;
	}

	public void setAdministrationDateStr(String administrationDateStr) {
		this.administrationDateStr = administrationDateStr;
	}

	public String getDeliveryTimeStr() {
		return deliveryTimeStr;
	}

	public void setDeliveryTimeStr(String deliveryTimeStr) {
		this.deliveryTimeStr = deliveryTimeStr;
	}

	public String getReceiverDateStr() {
		return receiverDateStr;
	}

	public void setReceiverDateStr(String receiverDateStr) {
		this.receiverDateStr = receiverDateStr;
	}

	public String getUpdateTimeStr() {
		return updateTimeStr;
	}

	public void setUpdateTimeStr(String updateTimeStr) {
		this.updateTimeStr = updateTimeStr;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getDeliveryPlace() {
		return deliveryPlace;
	}

	public void setDeliveryPlace(String deliveryPlace) {
		this.deliveryPlace = deliveryPlace;
	}	
    
	public String getDocArticlesId() {
		return docArticlesId;
	}

	public String getIsRemarks() {
		return isRemarks;
	}

	public void setIsRemarks(String isRemarks) {
		this.isRemarks = isRemarks;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setDocArticlesId(String docArticlesId) {
		this.docArticlesId = docArticlesId;
	}

	public String getDocArticlesName() {
		return docArticlesName;
	}

	public void setDocArticlesName(String docArticlesName) {
		this.docArticlesName = docArticlesName;
	}

	public Map<String, String> getDocInfo(String caseCode) {
		// TODO Auto-generated method stub
		return null;
	}
	 
}

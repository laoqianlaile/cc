package com.beidasoft.xzzf.punish.document.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 * 调查询问通知书实体类
 */
@Entity
@Table(name="ZF_DOC_ASKBOOK")
public class DocAskbook {
    // 调查询问通知书UUID
    @Id
    @Column(name = "ID")
    private String id;

    // 当事人姓名
    @Column(name = "PARTY_NAME")
    private String partyName;

    // 行为
    @Column(name = "PARTY_ACTION")
    private String partyAction;

    // 到达时间
    @Column(name = "ARRAVEL_TIME")
    private Date arravelTime;

    // 地址
    @Column(name = "SURVEY_ADDRESS")
    private String surveyAddress;

    // 材料
    @Column(name = "SURVEY_MATERIALS")
    private String surveyMaterials;

    // 联系人
    @Column(name = "SURVEY_PEOPLE")
    private String surveyPeople;

    // 联系电话
    @Column(name = "SURVEY_PHONE")
    private String surveyPhone;

    // 盖章时间
    @Column(name = "SEAL_TIME")
    private Date sealTime;

    // 执法单位印章图片
    @Lob
    @Column(name = "LAW_UNIT_SEAL")
    private String lawUnitSeal;

    // 执法单位印章值
    @Lob
    @Column(name = "LAW_UNIT_VALUE")
    private String lawUnitValue;

    // 执法单位印章位置
    @Column(name = "LAW_UNIT_PLACE")
    private String lawUnitPlace;

    // 执法单位印章时间
    @Column(name = "LAW_UNIT_DATE")
    private Date lawUnitDate;

    // 组织机构编号
    @Column(name = "ORGANS_CODE")
    private String organsCode;

    // 组织机构名称
    @Column(name = "ORGANS_NAME")
    private String organsName;

    // 附件地址
    @Column(name = "ENCLOSURE_ADDRESS")
    private String enclosureAddress;

    // 删除标记
    @Column(name = "DEL_FLG")
    private String delFlg;

    // 执法环节id
    @Column(name = "LAW_LINK_ID")
    private String lawLinkId;

    // 创建人id
    @Column(name = "CREATE_USER_ID")
    private String createUserId;

    // 创建人姓名
    @Column(name = "CREATE_USER_NAME")
    private String createUserName;

    // 创建时间
    @Column(name = "CREATE_TIME")
    private Date createTime;

    // 变更人id
    @Column(name = "UPDATE_USER_ID")
    private String updateUserId;

    // 变更人姓名
    @Column(name = "UPDATE_USER_NAME")
    private String updateUserName;

    // 变更时间
    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    // 执法办案唯一id
    @Column(name = "BASE_ID")
    private String baseId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public String getPartyAction() {
        return partyAction;
    }

    public void setPartyAction(String partyAction) {
        this.partyAction = partyAction;
    }

    public Date getArravelTime() {
        return arravelTime;
    }

    public void setArravelTime(Date arravelTime) {
        this.arravelTime = arravelTime;
    }

    public String getSurveyAddress() {
        return surveyAddress;
    }

    public void setSurveyAddress(String surveyAddress) {
        this.surveyAddress = surveyAddress;
    }

    public String getSurveyMaterials() {
        return surveyMaterials;
    }

    public void setSurveyMaterials(String surveyMaterials) {
        this.surveyMaterials = surveyMaterials;
    }

    public String getSurveyPeople() {
        return surveyPeople;
    }

    public void setSurveyPeople(String surveyPeople) {
        this.surveyPeople = surveyPeople;
    }

    public String getSurveyPhone() {
        return surveyPhone;
    }

    public void setSurveyPhone(String surveyPhone) {
        this.surveyPhone = surveyPhone;
    }

    public Date getSealTime() {
        return sealTime;
    }

    public void setSealTime(Date sealTime) {
        this.sealTime = sealTime;
    }

    public String getLawUnitSeal() {
        return lawUnitSeal;
    }

    public void setLawUnitSeal(String lawUnitSeal) {
        this.lawUnitSeal = lawUnitSeal;
    }

    public String getLawUnitValue() {
        return lawUnitValue;
    }

    public void setLawUnitValue(String lawUnitValue) {
        this.lawUnitValue = lawUnitValue;
    }

    public String getLawUnitPlace() {
        return lawUnitPlace;
    }

    public void setLawUnitPlace(String lawUnitPlace) {
        this.lawUnitPlace = lawUnitPlace;
    }

    public Date getLawUnitDate() {
        return lawUnitDate;
    }

    public void setLawUnitDate(Date lawUnitDate) {
        this.lawUnitDate = lawUnitDate;
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

	public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getBaseId() {
        return baseId;
    }

    public void setBaseId(String baseId) {
        this.baseId = baseId;
    }

}

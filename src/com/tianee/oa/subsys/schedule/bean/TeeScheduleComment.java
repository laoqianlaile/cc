package com.tianee.oa.subsys.schedule.bean;
import org.hibernate.annotations.Index;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.tianee.oa.core.org.bean.TeePerson;

@Entity
@Table(name="SCHEDULE_COMMENT")
public class TeeScheduleComment {
	@Id
	@GeneratedValue(generator = "system-uuid")  
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(columnDefinition = "char(32)",name="UUID")
	private String uuid;//自增id
	
	@ManyToOne()
	@Index(name="IDX8cd927bd9c844127a42e58011cb")
	@JoinColumn(name="SCHEDULE_ID")
	private TeeSchedule schedule;
	
	@ManyToOne()
	@Index(name="IDX3e8e069f076f4a4a867ed3ec4d5")
	@JoinColumn(name="USER_ID")
	private TeePerson user;
	
	@Lob
	@Column(name="CONTENT")
	private String content;//内容
	
	@Column(name="CR_TIME")
	private Calendar crTime;//批阅时间

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public TeeSchedule getSchedule() {
		return schedule;
	}

	public void setSchedule(TeeSchedule schedule) {
		this.schedule = schedule;
	}

	public TeePerson getUser() {
		return user;
	}

	public void setUser(TeePerson user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Calendar getCrTime() {
		return crTime;
	}

	public void setCrTime(Calendar crTime) {
		this.crTime = crTime;
	}
	
	
}

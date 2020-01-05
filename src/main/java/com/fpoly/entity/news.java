package com.fpoly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name = "News")
public class news {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@NotBlank(message = "Tiêu đề không được để trống !")
	String title;
	String imagestitle;
	@NotBlank(message = "Tóm tắt không được để trống !")
	String summary;
	@NotBlank(message = "Nội dung không được để trống !")
	String newsContent;
	String video;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	Date date;
	Boolean status;
	Integer views;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	Date updatedAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	Date deletedAt;

	@ManyToOne
	@JoinColumn(name = "categoriesId")
	categories categories;

	@ManyToOne
	@JoinColumn(name = "typeId")
	type type;

	@ManyToOne
	@JoinColumn(name = "memberId")
	member member;

	@ManyToOne
	@JoinColumn(name="approveId")
	member member2;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getImagestitle() {
		return imagestitle;
	}

	public void setImagestitle(String imagestitle) {
		this.imagestitle = imagestitle;
	}
	
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}

	public categories getCategories() {
		return categories;
	}

	public void setCategories(categories categories) {
		this.categories = categories;
	}

	public type getType() {
		return type;
	}

	public void setType(type type) {
		this.type = type;
	}

	public member getmember() {
		return member;
	}

	public void setmember(member member) {
		this.member = member;
	}
	
	public member getMember2() {
		return member2;
	}

	public void setMember2(member member2) {
		this.member2 = member2;
	}

}

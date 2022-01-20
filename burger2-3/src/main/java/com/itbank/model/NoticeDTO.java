package com.itbank.model;

import java.sql.Date;

//NOTICE_SEQ NOT NULL NUMBER         
//TITLE      NOT NULL VARCHAR2(500)  
//WRITER              VARCHAR2(500)  
//CONTENT    NOT NULL VARCHAR2(2000) 
//REQDATE             DATE           
//CNT        NOT NULL NUMBER         
//FLAG       NOT NULL VARCHAR2(100)  
//FILENAME            VARCHAR2(1000)

public class NoticeDTO {

	private int notice_seq, cnt;
	private Date regDate;
	private String title, writer, content, flag, fileName;
	
	
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	

	
	
}

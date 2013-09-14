package net.bitacademy.java41.vo;

import java.sql.Date;

public class Task {
	
	/*
	 * TNO`        INTEGER      NOT NULL COMMENT '태스크번호', -- 태스크번호
	`PNO`        INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`TITLE`      VARCHAR(255) NOT NULL COMMENT '작업명', -- 작업명
	`UIPROTOURL` VARCHAR(255) NULL     COMMENT 'UI프로토타입', -- UI프로토타입
	`CONTENT`    TEXT         NULL     COMMENT '내용', -- 내용
	`START_DATE` DATETIME     NULL     COMMENT '착수일', -- 착수일
	`END_DATE`   DATETIME     NULL     COMMENT '종료일', -- 종료일
	`STATUS`     INTEGER      NULL     DEFAULT 0 COMMENT '상태' -- 상태
	 * */
	protected int tno;
	protected int pno;
	protected String title;
	protected String uiProtocol;
	protected String content;
	protected Date startDate;
	protected Date endDate;
	protected int status;

	
	public int getTno() {
		return tno;
	}
	public Task setTno(int tno) {
		this.tno = tno;
		return this;
	}
	public int getPno() {
		return pno;
	}
	public Task setPno(int pno) {
		this.pno = pno;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public Task setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getUiProtocol() {
		return uiProtocol;
	}
	public Task setUiProtocol(String uiProtocol) {
		this.uiProtocol = uiProtocol;
		return this;
	}
	public String getContent() {
		return content;
	}
	public Task setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getStartDate() {
		return startDate;
	}
	public Task setStartDate(Date startDate) {
		this.startDate = startDate;
		return this;
	}
	public Date getEndDate() {
		return endDate;
	}
	public Task setEndDate(Date endDate) {
		this.endDate = endDate;
		return this;
	}
	public int getStatus() {
		return status;
	}
	public Task setStatus(int status) {
		this.status = status;
		return this;
	}
	
	
	
	
	
}

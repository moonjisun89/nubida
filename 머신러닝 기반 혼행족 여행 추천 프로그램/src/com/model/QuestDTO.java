package com.model;

public class QuestDTO {

	private int q_num;
	private String q_kinds;
	private String q_content;
	private String q_point;

	
	public QuestDTO() {}

	public QuestDTO(String q_content, String q_point) {
		super();
		this.q_content = q_content;
		this.q_point = q_point;
	}
	
	
	public QuestDTO(int q_num, String q_kinds, String q_content, String q_point) {
		super();
		this.q_num = q_num;
		this.q_kinds = q_kinds;
		this.q_content = q_content;
		this.q_point = q_point;
	}
	
	
	public QuestDTO(int q_num) {
		super();
		this.q_num = q_num;
	}
	
	
	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_kinds() {
		return q_kinds;
	}

	public void setQ_kinds(String q_kinds) {
		this.q_kinds = q_kinds;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_point() {
		return q_point;
	}

	public void setQ_point(String q_point) {
		this.q_point = q_point;
	}

}

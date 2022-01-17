package com.myshop.qna;

public class Qna {
	private int num;
	private int p_num;
	private String mem_id;
	private int qna_type;
	private int top_question;
	private String content;

	public Qna() {
		super();
	}

	public Qna(int num, int p_num, String mem_id, int qna_type, int top_question, String content) {
		super();
		this.num = num;
		this.p_num = p_num;
		this.mem_id = mem_id;
		this.qna_type = qna_type;
		this.top_question = top_question;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getQna_type() {
		return qna_type;
	}

	public void setQna_type(int qna_type) {
		this.qna_type = qna_type;
	}

	public int getTop_question() {
		return top_question;
	}

	public void setTop_question(int top_question) {
		this.top_question = top_question;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Qna [num=" + num + ", p_num=" + p_num + ", mem_id=" + mem_id + ", qna_type=" + qna_type
				+ ", top_question=" + top_question + ", content=" + content + "]";
	}
}
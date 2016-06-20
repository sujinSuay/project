package com.board.vo;

import java.util.Date;

public class Comment {
	
	private int board_no;  /** 게시글 고유  번호 **/
	private int comment_id; /** 댓글의 고유 아이디  **/
	private String comment_content;  /** 댓글의 내용  **/
	private String m_id; /** 댓글을 게시한  회원의 아이디  **/
	private Date comment_date; /** 댓글을 게시한 날짜  **/
	
	
	public Comment(){
		
	}
	
	
	public Comment(int board_no, int comment_id, String comment_content, String m_id, Date comment_date) {
		super();
		this.board_no = board_no;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.m_id = m_id;
		this.comment_date = comment_date;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public int getComment_id() {
		return comment_id;
	}


	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}


	public String getComment_content() {
		return comment_content;
	}


	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public Date getComment_date() {
		return comment_date;
	}


	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}


	@Override
	public String toString() {
		return "Comment [board_no=" + board_no + ", comment_id=" + comment_id + ", comment_content=" + comment_content
				+ ", m_id=" + m_id + ", comment_date=" + comment_date + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + board_no;
		result = prime * result + ((comment_content == null) ? 0 : comment_content.hashCode());
		result = prime * result + ((comment_date == null) ? 0 : comment_date.hashCode());
		result = prime * result + comment_id;
		result = prime * result + ((m_id == null) ? 0 : m_id.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		if (board_no != other.board_no)
			return false;
		if (comment_content == null) {
			if (other.comment_content != null)
				return false;
		} else if (!comment_content.equals(other.comment_content))
			return false;
		if (comment_date == null) {
			if (other.comment_date != null)
				return false;
		} else if (!comment_date.equals(other.comment_date))
			return false;
		if (comment_id != other.comment_id)
			return false;
		if (m_id == null) {
			if (other.m_id != null)
				return false;
		} else if (!m_id.equals(other.m_id))
			return false;
		return true;
	}
	
	
	
	
	
	

}

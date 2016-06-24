package com.member.vo;

import java.util.Date;

import com.common.util.JsonDateConverter;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class MyPage {
	private int board_no; /** 게시글 번호  **/
	private String board_title;   /** 게시글 제목   **/
	@JsonSerialize(using=JsonDateConverter.class)
	private Date board_date;  /** 게시 날짜  **/
	private String m_id; /** 게시한 사람의 id  **/
	private int board_hits; /** 게시글 조회수  **/
	private String board_content; /** 게시글 내용  **/
	private int board_likes; /** 게시글 좋아요 갯수  **/
	private int singer_id;  /** 어떤 가수의 갤러리인지를 나타내기 위한 가수의 고유 id  **/
	private String board_writer_type;  /**  게시자 타입 **/
	private int comment_id; /** 댓글의 고유 아이디  **/
	private String comment_content;  /** 댓글의 내용  **/
	@JsonSerialize(using=JsonDateConverter.class)
	private Date comment_date; /** 댓글을 게시한 날짜  **/
	private String singer_name;
	
	public MyPage(){}

	public MyPage(int board_no, String board_title, Date board_date, String m_id, int board_hits, String board_content,
			int board_likes, int singer_id, String board_writer_type, int comment_id, String comment_content,
			Date comment_date, String singer_name) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.m_id = m_id;
		this.board_hits = board_hits;
		this.board_content = board_content;
		this.board_likes = board_likes;
		this.singer_id = singer_id;
		this.board_writer_type = board_writer_type;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.singer_name = singer_name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_likes() {
		return board_likes;
	}

	public void setBoard_likes(int board_likes) {
		this.board_likes = board_likes;
	}

	public int getSinger_id() {
		return singer_id;
	}

	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}

	public String getBoard_writer_type() {
		return board_writer_type;
	}

	public void setBoard_writer_type(String board_writer_type) {
		this.board_writer_type = board_writer_type;
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

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getSinger_name() {
		return singer_name;
	}

	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((board_content == null) ? 0 : board_content.hashCode());
		result = prime * result + ((board_date == null) ? 0 : board_date.hashCode());
		result = prime * result + board_hits;
		result = prime * result + board_likes;
		result = prime * result + board_no;
		result = prime * result + ((board_title == null) ? 0 : board_title.hashCode());
		result = prime * result + ((board_writer_type == null) ? 0 : board_writer_type.hashCode());
		result = prime * result + ((comment_content == null) ? 0 : comment_content.hashCode());
		result = prime * result + ((comment_date == null) ? 0 : comment_date.hashCode());
		result = prime * result + comment_id;
		result = prime * result + ((m_id == null) ? 0 : m_id.hashCode());
		result = prime * result + singer_id;
		result = prime * result + ((singer_name == null) ? 0 : singer_name.hashCode());
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
		MyPage other = (MyPage) obj;
		if (board_content == null) {
			if (other.board_content != null)
				return false;
		} else if (!board_content.equals(other.board_content))
			return false;
		if (board_date == null) {
			if (other.board_date != null)
				return false;
		} else if (!board_date.equals(other.board_date))
			return false;
		if (board_hits != other.board_hits)
			return false;
		if (board_likes != other.board_likes)
			return false;
		if (board_no != other.board_no)
			return false;
		if (board_title == null) {
			if (other.board_title != null)
				return false;
		} else if (!board_title.equals(other.board_title))
			return false;
		if (board_writer_type == null) {
			if (other.board_writer_type != null)
				return false;
		} else if (!board_writer_type.equals(other.board_writer_type))
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
		if (singer_id != other.singer_id)
			return false;
		if (singer_name == null) {
			if (other.singer_name != null)
				return false;
		} else if (!singer_name.equals(other.singer_name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MyPage [board_no=" + board_no + ", board_title=" + board_title + ", board_date=" + board_date
				+ ", m_id=" + m_id + ", board_hits=" + board_hits + ", board_content=" + board_content
				+ ", board_likes=" + board_likes + ", singer_id=" + singer_id + ", board_writer_type="
				+ board_writer_type + ", comment_id=" + comment_id + ", comment_content=" + comment_content
				+ ", comment_date=" + comment_date + ", singer_name=" + singer_name + "]";
	}

	
	
}


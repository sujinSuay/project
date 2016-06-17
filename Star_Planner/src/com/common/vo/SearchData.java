package com.common.vo;

import java.util.Date;

/** 해당하는 day에 특정 가수의 조회수를 알기위해서 필요한 테이블의 vo  **/
public class SearchData {
	

	private int singer_id;  /** 가수 고유 id  **/
	private int singer_count;  /** 가수 갤러리에 접속한 조회 수  **/
	private Date search_date; /** 날짜 -년,월,일 까지만 입력받음   **/
	
	public SearchData(){
		
	}
	
	public SearchData(int singer_id, int singer_count, Date search_date) {
		super();
		this.singer_id = singer_id;
		this.singer_count = singer_count;
		this.search_date = search_date;
	}

	public int getSinger_id() {
		return singer_id;
	}

	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}

	public int getSinger_count() {
		return singer_count;
	}

	public void setSinger_count(int singer_count) {
		this.singer_count = singer_count;
	}

	public Date getSearch_date() {
		return search_date;
	}

	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}

	@Override
	public String toString() {
		return "SearchData [singer_id=" + singer_id + ", singer_count=" + singer_count + ", search_date=" + search_date
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((search_date == null) ? 0 : search_date.hashCode());
		result = prime * result + singer_count;
		result = prime * result + singer_id;
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
		SearchData other = (SearchData) obj;
		if (search_date == null) {
			if (other.search_date != null)
				return false;
		} else if (!search_date.equals(other.search_date))
			return false;
		if (singer_count != other.singer_count)
			return false;
		if (singer_id != other.singer_id)
			return false;
		return true;
	}
	
	
	
	
	
	
	
	

}

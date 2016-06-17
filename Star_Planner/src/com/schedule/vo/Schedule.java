package com.schedule.vo;

import java.util.Date;

public class Schedule {
	
	private int schedule_id;  /** 스케줄 고유 번호 **/
	private Date schedule_time;  /** 스케줄 일시 **/
	private int schedule_time_range;  /** 스케줄의 공연 시간  **/
	private int singer_id; /** 스케줄이 있는 가수의 고유 아이디 **/
	private String schedule_name; /** 스케줄의 이름 **/
	private String type_name; /** 스케줄의 타입 - 행사, 드라마, 광고...  **/
	private String schedule_address; /** 스케줄이 열리는 위치(장소) **/
	
	public Schedule(){
		
	}

	public Schedule(int schedule_id, Date schedule_time, int schedule_time_range, int singer_id, String schedule_name,
			String type_name, String schedule_address) {
		super();
		this.schedule_id = schedule_id;
		this.schedule_time = schedule_time;
		this.schedule_time_range = schedule_time_range;
		this.singer_id = singer_id;
		this.schedule_name = schedule_name;
		this.type_name = type_name;
		this.schedule_address = schedule_address;
	}

	public int getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}

	public Date getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(Date schedule_time) {
		this.schedule_time = schedule_time;
	}

	public int getSchedule_time_range() {
		return schedule_time_range;
	}

	public void setSchedule_time_range(int schedule_time_range) {
		this.schedule_time_range = schedule_time_range;
	}

	public int getSinger_id() {
		return singer_id;
	}

	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}

	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getSchedule_address() {
		return schedule_address;
	}

	public void setSchedule_address(String schedule_address) {
		this.schedule_address = schedule_address;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_id=" + schedule_id + ", schedule_time=" + schedule_time + ", schedule_time_range="
				+ schedule_time_range + ", singer_id=" + singer_id + ", schedule_name=" + schedule_name + ", type_name="
				+ type_name + ", schedule_address=" + schedule_address + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((schedule_address == null) ? 0 : schedule_address.hashCode());
		result = prime * result + schedule_id;
		result = prime * result + ((schedule_name == null) ? 0 : schedule_name.hashCode());
		result = prime * result + ((schedule_time == null) ? 0 : schedule_time.hashCode());
		result = prime * result + schedule_time_range;
		result = prime * result + singer_id;
		result = prime * result + ((type_name == null) ? 0 : type_name.hashCode());
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
		Schedule other = (Schedule) obj;
		if (schedule_address == null) {
			if (other.schedule_address != null)
				return false;
		} else if (!schedule_address.equals(other.schedule_address))
			return false;
		if (schedule_id != other.schedule_id)
			return false;
		if (schedule_name == null) {
			if (other.schedule_name != null)
				return false;
		} else if (!schedule_name.equals(other.schedule_name))
			return false;
		if (schedule_time == null) {
			if (other.schedule_time != null)
				return false;
		} else if (!schedule_time.equals(other.schedule_time))
			return false;
		if (schedule_time_range != other.schedule_time_range)
			return false;
		if (singer_id != other.singer_id)
			return false;
		if (type_name == null) {
			if (other.type_name != null)
				return false;
		} else if (!type_name.equals(other.type_name))
			return false;
		return true;
	}
	
	
	
	
	
	

}

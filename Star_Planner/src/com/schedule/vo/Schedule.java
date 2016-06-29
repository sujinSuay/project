package com.schedule.vo;

import java.io.Serializable;

import com.common.vo.Group;
import com.common.vo.Singer;

public class Schedule implements Serializable{
	
	private int schedule_id;  /** 스케줄 고유 번호 **/
	private String schedule_start;  /** 스케줄 일시 **/
	private String schedule_end;  /** 스케줄 일시 **/
	private int singer_id; /** 스케줄이 있는 가수의 고유 아이디 **/
	private int group_id; /** 회사 **/
	private String schedule_name; /** 스케줄의 이름 **/
	private String type_name; /** 스케줄의 타입 - 행사, 드라마, 광고...  **/
	private String schedule_address; /** 스케줄이 열리는 위치(장소) **/
	private String schedule_contents; /** 스케줄 정보 **/
	private Singer singer;
	private Group group;
	
	public Schedule(){
		
	}

	public Schedule(int schedule_id, String schedule_start, String schedule_end, int singer_id, int group_id,
			String schedule_name, String type_name, String schedule_address, String schedule_contents, Singer singer,
			Group group) {
		super();
		this.schedule_id = schedule_id;
		this.schedule_start = schedule_start;
		this.schedule_end = schedule_end;
		this.singer_id = singer_id;
		this.group_id = group_id;
		this.schedule_name = schedule_name;
		this.type_name = type_name;
		this.schedule_address = schedule_address;
		this.schedule_contents = schedule_contents;
		this.singer = singer;
		this.group = group;
	}

	public Schedule(String schedule_start, String schedule_end, int singer_id, int group_id, String schedule_name,
			String type_name, String schedule_address, String schedule_contents, Singer singer, Group group) {
		super();
		this.schedule_start = schedule_start;
		this.schedule_end = schedule_end;
		this.singer_id = singer_id;
		this.group_id = group_id;
		this.schedule_name = schedule_name;
		this.type_name = type_name;
		this.schedule_address = schedule_address;
		this.schedule_contents = schedule_contents;
		this.singer = singer;
		this.group = group;
	}

	public int getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getSchedule_start() {
		return schedule_start;
	}

	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}

	public String getSchedule_end() {
		return schedule_end;
	}

	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}

	public int getSinger_id() {
		return singer_id;
	}

	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
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

	public String getSchedule_contents() {
		return schedule_contents;
	}

	public void setSchedule_contents(String schedule_contents) {
		this.schedule_contents = schedule_contents;
	}

	public Singer getSinger() {
		return singer;
	}

	public void setSinger(Singer singer) {
		this.singer = singer;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_id=" + schedule_id + ", schedule_start=" + schedule_start + ", schedule_end="
				+ schedule_end + ", singer_id=" + singer_id + ", group_id=" + group_id + ", schedule_name="
				+ schedule_name + ", type_name=" + type_name + ", schedule_address=" + schedule_address
				+ ", schedule_contents=" + schedule_contents + ", singer=" + singer + ", group=" + group + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + group_id;
		result = prime * result + ((schedule_address == null) ? 0 : schedule_address.hashCode());
		result = prime * result + ((schedule_contents == null) ? 0 : schedule_contents.hashCode());
		result = prime * result + ((schedule_end == null) ? 0 : schedule_end.hashCode());
		result = prime * result + schedule_id;
		result = prime * result + ((schedule_name == null) ? 0 : schedule_name.hashCode());
		result = prime * result + ((schedule_start == null) ? 0 : schedule_start.hashCode());
		result = prime * result + ((singer == null) ? 0 : singer.hashCode());
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
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (group_id != other.group_id)
			return false;
		if (schedule_address == null) {
			if (other.schedule_address != null)
				return false;
		} else if (!schedule_address.equals(other.schedule_address))
			return false;
		if (schedule_contents == null) {
			if (other.schedule_contents != null)
				return false;
		} else if (!schedule_contents.equals(other.schedule_contents))
			return false;
		if (schedule_end == null) {
			if (other.schedule_end != null)
				return false;
		} else if (!schedule_end.equals(other.schedule_end))
			return false;
		if (schedule_id != other.schedule_id)
			return false;
		if (schedule_name == null) {
			if (other.schedule_name != null)
				return false;
		} else if (!schedule_name.equals(other.schedule_name))
			return false;
		if (schedule_start == null) {
			if (other.schedule_start != null)
				return false;
		} else if (!schedule_start.equals(other.schedule_start))
			return false;
		if (singer == null) {
			if (other.singer != null)
				return false;
		} else if (!singer.equals(other.singer))
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

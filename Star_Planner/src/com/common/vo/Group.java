package com.common.vo;

import java.io.Serializable;

public class Group implements Serializable{
	
	private int group_id;  /** 회원이 속한 그룹.  1번:admin, 2번: 일반회원, 3번: 소속사 매니저 **/
	private String group_name;  /** 그룹 이름 **/
	private String group_address;  /** 그룹의 위치(회사의 주소) **/
	private String group_phone; /** 그룹의 전화번호 (회사 전화번호)  **/
	private String group_link; /** 회사 사이트의 링크 **/
	
	
	
	public Group(){
		
	}

	
	public Group(int group_id, String group_name, String group_address, String group_phone, String group_link) {
		super();
		this.group_id = group_id;
		this.group_name = group_name;
		this.group_address = group_address;
		this.group_phone = group_phone;
		this.group_link = group_link;
	}


	public int getGroup_id() {
		return group_id;
	}


	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}


	public String getGroup_name() {
		return group_name;
	}


	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}


	public String getGroup_address() {
		return group_address;
	}


	public void setGroup_address(String group_address) {
		this.group_address = group_address;
	}


	public String getGroup_phone() {
		return group_phone;
	}


	public void setGroup_phone(String group_phone) {
		this.group_phone = group_phone;
	}


	public String getGroup_link() {
		return group_link;
	}


	public void setGroup_link(String group_link) {
		this.group_link = group_link;
	}


	@Override
	public String toString() {
		return "Group [group_id=" + group_id + ", group_name=" + group_name + ", group_address=" + group_address
				+ ", group_phone=" + group_phone + ", group_link=" + group_link + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + group_id;
		result = prime * result + ((group_address == null) ? 0 : group_address.hashCode());
		result = prime * result + ((group_link == null) ? 0 : group_link.hashCode());
		result = prime * result + ((group_name == null) ? 0 : group_name.hashCode());
		result = prime * result + ((group_phone == null) ? 0 : group_phone.hashCode());
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
		Group other = (Group) obj;
		if (group_id != other.group_id)
			return false;
		if (group_address == null) {
			if (other.group_address != null)
				return false;
		} else if (!group_address.equals(other.group_address))
			return false;
		if (group_link == null) {
			if (other.group_link != null)
				return false;
		} else if (!group_link.equals(other.group_link))
			return false;
		if (group_name == null) {
			if (other.group_name != null)
				return false;
		} else if (!group_name.equals(other.group_name))
			return false;
		if (group_phone == null) {
			if (other.group_phone != null)
				return false;
		} else if (!group_phone.equals(other.group_phone))
			return false;
		return true;
	}

	
	
	
	
	
}

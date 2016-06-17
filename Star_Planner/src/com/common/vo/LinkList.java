package com.common.vo;

public class LinkList {
	
	private String link_type; /** 링크가 어떤 타입인지 - 게시글, main 화면인지  **/
	private String link_address;  /** 링크의 주소 - 하이퍼링크, 파일주소  **/
	private String file_name; /** 파일일 경우, 파일의 이름  **/
	private int link_id; /** 식별값 - board_id, singer_id, group_id  **/
	
	
	public LinkList(){
		
	}


	public LinkList(String link_type, String link_address, String file_name, int link_id) {
		super();
		this.link_type = link_type;
		this.link_address = link_address;
		this.file_name = file_name;
		this.link_id = link_id;
	}


	public String getLink_type() {
		return link_type;
	}


	public void setLink_type(String link_type) {
		this.link_type = link_type;
	}


	public String getLink_address() {
		return link_address;
	}


	public void setLink_address(String link_address) {
		this.link_address = link_address;
	}


	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	public int getLink_id() {
		return link_id;
	}


	public void setLink_id(int link_id) {
		this.link_id = link_id;
	}


	@Override
	public String toString() {
		return "LinkList [link_type=" + link_type + ", link_address=" + link_address + ", file_name=" + file_name
				+ ", link_id=" + link_id + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((file_name == null) ? 0 : file_name.hashCode());
		result = prime * result + ((link_address == null) ? 0 : link_address.hashCode());
		result = prime * result + link_id;
		result = prime * result + ((link_type == null) ? 0 : link_type.hashCode());
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
		LinkList other = (LinkList) obj;
		if (file_name == null) {
			if (other.file_name != null)
				return false;
		} else if (!file_name.equals(other.file_name))
			return false;
		if (link_address == null) {
			if (other.link_address != null)
				return false;
		} else if (!link_address.equals(other.link_address))
			return false;
		if (link_id != other.link_id)
			return false;
		if (link_type == null) {
			if (other.link_type != null)
				return false;
		} else if (!link_type.equals(other.link_type))
			return false;
		return true;
	}
	
	
	
	
	
	
	
	
	

}

package com.common.vo;

public class Singer {
	
	private int singer_id; /** 가수 고유 id **/
	private String singer_name;  /** 가수 이름 **/
	private int group;  /** 가수가 속한 그룹 **/
	private String type_name; /** 가수의 분류 - 여자그룹, 남자그룹, 여자 솔로, 남자 솔로, 기타 **/
	private String singer_link; /** 가수의 개인 사이트(검색) 링크 **/
	private int singer_favorite; /** 가수를 선호하는 회원의 수 **/
	private String singer_tag; /** 가수를 검색했을때 등장할 태그 - 'a' 입력시 aoa로 인식하도록 하는 tag **/
	
	
	public Singer(){
		
	}
	
	
	public Singer(int singer_id, String singer_name, int group, String type_name, String singer_link,
			int singer_favorite, String singer_tag) {
		super();
		this.singer_id = singer_id;
		this.singer_name = singer_name;
		this.group = group;
		this.type_name = type_name;
		this.singer_link = singer_link;
		this.singer_favorite = singer_favorite;
		this.singer_tag = singer_tag;
	}

	
	

	public int getSinger_id() {
		return singer_id;
	}


	public void setSinger_id(int singer_id) {
		this.singer_id = singer_id;
	}


	public String getSinger_name() {
		return singer_name;
	}


	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}


	public int getGroup() {
		return group;
	}


	public void setGroup(int group) {
		this.group = group;
	}


	public String getType_name() {
		return type_name;
	}


	public void setType_name(String type_name) {
		this.type_name = type_name;
	}


	public String getSinger_link() {
		return singer_link;
	}


	public void setSinger_link(String singer_link) {
		this.singer_link = singer_link;
	}


	public int getSinger_favorite() {
		return singer_favorite;
	}


	public void setSinger_favorite(int singer_favorite) {
		this.singer_favorite = singer_favorite;
	}


	public String getSinger_tag() {
		return singer_tag;
	}


	public void setSinger_tag(String singer_tag) {
		this.singer_tag = singer_tag;
	}


	@Override
	public String toString() {
		return "Singer [singer_id=" + singer_id + ", singer_name=" + singer_name + ", group=" + group + ", type_name="
				+ type_name + ", singer_link=" + singer_link + ", singer_favorite=" + singer_favorite + ", singer_tag="
				+ singer_tag + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + group;
		result = prime * result + singer_favorite;
		result = prime * result + singer_id;
		result = prime * result + ((singer_link == null) ? 0 : singer_link.hashCode());
		result = prime * result + ((singer_name == null) ? 0 : singer_name.hashCode());
		result = prime * result + ((singer_tag == null) ? 0 : singer_tag.hashCode());
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
		Singer other = (Singer) obj;
		if (group != other.group)
			return false;
		if (singer_favorite != other.singer_favorite)
			return false;
		if (singer_id != other.singer_id)
			return false;
		if (singer_link == null) {
			if (other.singer_link != null)
				return false;
		} else if (!singer_link.equals(other.singer_link))
			return false;
		if (singer_name == null) {
			if (other.singer_name != null)
				return false;
		} else if (!singer_name.equals(other.singer_name))
			return false;
		if (singer_tag == null) {
			if (other.singer_tag != null)
				return false;
		} else if (!singer_tag.equals(other.singer_tag))
			return false;
		if (type_name == null) {
			if (other.type_name != null)
				return false;
		} else if (!type_name.equals(other.type_name))
			return false;
		return true;
	}
	
	
	
	
	
	
	

}

package com.member.vo;

public class SingerList {
	
	private String group_name;
	private String singer_name;
	private String type_name;
	private int singer_favorite;
	
	public SingerList() {
		
	}

	public SingerList(String group_name, String singer_name, String type_name, int singer_favorite) {
		super();
		this.group_name = group_name;
		this.singer_name = singer_name;
		this.type_name = type_name;
		this.singer_favorite = singer_favorite;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getSinger_name() {
		return singer_name;
	}

	public void setSinger_name(String singer_name) {
		this.singer_name = singer_name;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public int getSinger_favorite() {
		return singer_favorite;
	}

	public void setSinger_favorite(int singer_favorite) {
		this.singer_favorite = singer_favorite;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((group_name == null) ? 0 : group_name.hashCode());
		result = prime * result + singer_favorite;
		result = prime * result + ((singer_name == null) ? 0 : singer_name.hashCode());
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
		SingerList other = (SingerList) obj;
		if (group_name == null) {
			if (other.group_name != null)
				return false;
		} else if (!group_name.equals(other.group_name))
			return false;
		if (singer_favorite != other.singer_favorite)
			return false;
		if (singer_name == null) {
			if (other.singer_name != null)
				return false;
		} else if (!singer_name.equals(other.singer_name))
			return false;
		if (type_name == null) {
			if (other.type_name != null)
				return false;
		} else if (!type_name.equals(other.type_name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SingerList [group_name=" + group_name + ", singer_name=" + singer_name + ", type_name=" + type_name
				+ ", singer_favorite=" + singer_favorite + "]";
	}
	
	
	

}

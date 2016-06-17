package com.common.vo;


/** 카테고리 테이블  **/
public class TypeList {
	
	private String type_name; /** 타입 이름 **/
	private String word_type; /** 타입 종류 **/
	
	private TypeList(){
		
	}
	
	
	public TypeList(String type_name, String word_type) {
		super();
		this.type_name = type_name;
		this.word_type = word_type;
	}


	public String getType_name() {
		return type_name;
	}


	public void setType_name(String type_name) {
		this.type_name = type_name;
	}


	public String getWord_type() {
		return word_type;
	}


	public void setWord_type(String word_type) {
		this.word_type = word_type;
	}


	@Override
	public String toString() {
		return "TypeList [type_name=" + type_name + ", word_type=" + word_type + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((type_name == null) ? 0 : type_name.hashCode());
		result = prime * result + ((word_type == null) ? 0 : word_type.hashCode());
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
		TypeList other = (TypeList) obj;
		if (type_name == null) {
			if (other.type_name != null)
				return false;
		} else if (!type_name.equals(other.type_name))
			return false;
		if (word_type == null) {
			if (other.word_type != null)
				return false;
		} else if (!word_type.equals(other.word_type))
			return false;
		return true;
	}
	
	
	
	
	

}

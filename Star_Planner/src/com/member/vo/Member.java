package com.member.vo;



public class Member {
	
	/*@NotEmpty(message="아이디를 입력해주세요")*/
	private String m_id;  /**회원 아이디 **/
	private String social_no; /** 회원 주민번호  **/
	private String password; /**회원 비밀번호 **/
	private int group_id; /** 회원이 속한 그룹. 1번:admin, 2번: 일반회원, 3번: 소속사 매니저 **/
	private String gender; /**회원 성별 **/
	private String name; /**회원 이름 **/
	private String email; /**회원의 이메일 **/
	private String address; /**회원 주소 **/
	private String phone; /**회원 전화번호 **/
	private String favorite;  /**회원이 선호하는 그룹의 이름. 선호그릅은 다중 선택 가능. ','로 구분 **/
	private String tem_group;
	
	
	public Member(){
		
	}


	public Member(String m_id, String social_no, String password, int group_id, String gender, String name,
			String email, String address, String phone, String favorite, String tem_group) {
		super();
		this.m_id = m_id;
		this.social_no = social_no;
		this.password = password;
		this.group_id = group_id;
		this.gender = gender;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.favorite = favorite;
		this.tem_group = tem_group;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getSocial_no() {
		return social_no;
	}


	public void setSocial_no(String social_no) {
		this.social_no = social_no;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getGroup_id() {
		return group_id;
	}


	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getFavorite() {
		return favorite;
	}


	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}


	public String getTem_group() {
		return tem_group;
	}


	public void setTem_group(String tem_group) {
		this.tem_group = tem_group;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((favorite == null) ? 0 : favorite.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + group_id;
		result = prime * result + ((m_id == null) ? 0 : m_id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((social_no == null) ? 0 : social_no.hashCode());
		result = prime * result + ((tem_group == null) ? 0 : tem_group.hashCode());
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
		Member other = (Member) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (favorite == null) {
			if (other.favorite != null)
				return false;
		} else if (!favorite.equals(other.favorite))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (group_id != other.group_id)
			return false;
		if (m_id == null) {
			if (other.m_id != null)
				return false;
		} else if (!m_id.equals(other.m_id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (social_no == null) {
			if (other.social_no != null)
				return false;
		} else if (!social_no.equals(other.social_no))
			return false;
		if (tem_group == null) {
			if (other.tem_group != null)
				return false;
		} else if (!tem_group.equals(other.tem_group))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", social_no=" + social_no + ", password=" + password + ", group_id=" + group_id
				+ ", gender=" + gender + ", name=" + name + ", email=" + email + ", address=" + address + ", phone="
				+ phone + ", favorite=" + favorite + ", tem_group=" + tem_group + "]";
	}
	
	

}

package com.member.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.member.vo.Member;


/*
 * 	Validator - 요청파라미터 검증하는 컴포넌트
 * 		1. implements Validator
 * 		2. method overriding
 * 			- support() : 검증 의뢰받은 객체가 검증가능한 타입의 객체인지 체크하는 메소드
 * 			- validate() : 검증로직을 구현하는 클래스
 * 		3. Controller handler에서 validate() 를 호출
 */
public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		//Class객채A.isAssignableFrom(Class객채b) A하고 B하고 같은 클래스냐? 같으면 true
		// TODO Auto-generated method stub
		return clazz.isAssignableFrom(Member.class);
	}

	@Override
	//매개변수 1: 검증대상 개채, 2: 검증실패시 그 오류 정보를 저장할 Errors/BindingResult
	public void validate(Object target, Errors errors) {
		/*
		 * 1. id/pwd/name -> 필수 입력사항
		 * 2. id/pwd - 3글자 이상
		 * 3. 관심사항은 3개이상 선택
		 */
		Member member = (Member)target;
		/*if(member.getId()==null || member.getId().trim().isEmpty()){
			errors.rejectValue("id", "","ID를 꼭 넣으세요");
		}*/
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "","ID를 안넣어 에러남");
		
		if(member.getPassword()==null || member.getPassword().trim().isEmpty()){
			errors.rejectValue("password", "","패스워드를 꼭 넣으세요");
		}
		if(member.getName()==null || member.getName().trim().isEmpty()){
			errors.rejectValue("name", "","이름을 꼭 넣으세요");
		}
		if(member.getM_id()!=null && member.getM_id().length()<3){
			errors.rejectValue("id", "","ID는 3글자이상 입력하세요");
		}
		
	}

}

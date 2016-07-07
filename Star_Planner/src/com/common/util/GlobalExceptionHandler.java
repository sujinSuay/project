package com.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/*
- Controller에 등록된 @ExceptionHandler 가 우선이다. 거기서 못잡은 것 여기서 잡게 한다. - 확인함.
-<mvc:annotation-driven /> 등록되어 있어야 한다.
	질문 : <mvc:annotation-driven /> 의 무엇이 필요해서 이 설정이 필요한가? 답 : 이 태그에의해 등록 되는 ExceptionHandlerExceptionResolver 가 처리하는듯
- @ExceptionHandler 메소드를 구현한 클래스를 만든다. @ControllerAdvice("컨트롤러 패키지") 를 붙인다. 
- Component 스캔에 추가해야함.
	- @ControllerAdvice가 @Component의 하위 어노테이션임
*/
@ControllerAdvice("com.")
public class GlobalExceptionHandler {
	
	public GlobalExceptionHandler(){
		System.out.println("GlobalExceptionHandler");
	}
	@ExceptionHandler(Exception.class)
	public String GlobalExceptionHandler(HttpServletRequest request, Exception e){
		request.setAttribute("exception", e);
		System.out.println(e.getMessage());
		request.setAttribute("error", "에러가발생하였습니다.");
		return "/WEB-INF/common/global_error.jsp";
	}
}

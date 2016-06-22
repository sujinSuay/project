package com.common.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/*
 * MappingJacksonHttpMessageConverter (역할: java객체 (VO, Collection) -> JSON({},[])
 * JsonSerializer: 특징 Property(instance변수)를 원하는 형태의 문자열로 변환
 * 	ex) 기본변환: java.util.Date(자바타입) -> 숫자 밀리초로 변환
 * 				java.util.Date -> yyyy-MM-dd -> JsonSerializer 구현
 * 1.변환기 구현: extends JsonSerializer<T> 구현. T: 변환할 Java type지정
 * 2.VO의 instance 변수에 @JsonSerialize Annotation 선언
 */
public class JsonDateConverter extends JsonSerializer<Date>{
	//1.변환할 데이터, 2:변환기, 3:기존변환기
	public void serialize(Date date, JsonGenerator gen, SerializerProvider provider) throws IOException, JsonProcessingException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String birthday = sdf.format(date);
		gen.writeString(birthday);//변환될 문자열을 MappingJacksonHttpMessageConverter가 JSON으로 변환할때 전달한다
	}
}

package com.common.util;

public class TextUtil {

	public static String textToHtml(String src){
		return src.replaceAll("&", "&amp;")
				   .replaceAll("<", "&lt;")
				   .replaceAll(">", "&gt;")
				   .replaceAll(" ",  "&nbsp;")
				   .replaceAll("\n", "<br>");
	}
	public static String htmlToText(String src){
		return src.replaceAll("&lt;", "<")
				   .replaceAll("&gt;", ">")
				   .replaceAll("&nbsp;", " ")
				   .replaceAll("<br>", "\n")
				   .replaceAll("&amp;", "&");
	}
}

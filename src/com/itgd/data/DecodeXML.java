package com.itgd.data;

import java.util.StringTokenizer;

public class DecodeXML {
	
	  
	public  String decodeEntities(String data){
		StringBuffer stringbuffer = new StringBuffer();
		if (data == null || data.length() == 0) {
			return "";
		}

		for (StringTokenizer stringtokenizer = new StringTokenizer(data,"&\"'><", true); 
		stringtokenizer.hasMoreTokens();) {
			String token = stringtokenizer.nextToken();

			if (token.endsWith("<")) {
				stringbuffer.append(token.substring(0, token.length() - 1));
				stringbuffer.append("&lt;");
			} else if (token.endsWith(">")) {
				stringbuffer.append(token.substring(0, token.length() - 1));
				stringbuffer.append("&gt;");
			} else if (token.startsWith("'")) {
				stringbuffer.append("&apos;");
				stringbuffer.append(token.substring(token.length() - 1, 0));
			} else if (token.startsWith("&")) {
				stringbuffer.append("&amp;");
				stringbuffer.append(token.substring(token.length() - 1, 0));
			} else {
				stringbuffer.append(token);
			}
		}
		
		return stringbuffer.toString();
	}
	
	
	

	
}

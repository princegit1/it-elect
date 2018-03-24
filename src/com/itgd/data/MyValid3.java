package com.itgd.data;

import java.util.StringTokenizer;
import java.util.Arrays;
import java.io.*;

/**
 * This class is use to change the special characters in a image name to insert it in to 
 * mySQL database.
 * 
 * 
 * @author Santosh Kumar Jena
 * @version
 */

public class MyValid3 {

	public MyValid3() {
	}

	public String getValidWord(String checkText) {
		String stTemp = null;
		String validStr = "";
		String[] strArr = null;
		String checkList = null;

		try {
			FileInputStream fis = new FileInputStream(
					"D:\\santosh\\stopWordListG.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			StringTokenizer st = null;
			MyValid3 sWc = null;

			sWc = new MyValid3();
			checkList = br.readLine();
			strArr = checkList.split(" ");
			Arrays.sort(strArr);
			checkText = checkText.toLowerCase();
			st = new StringTokenizer(checkText);

			while (st.hasMoreTokens()) {
				String validStrTemp = "";
				stTemp = st.nextToken();
				int v = Arrays.binarySearch(strArr, stTemp);

				if (v < 0) {
					validStrTemp = stTemp + sWc.doStrAppend(stTemp.length());
				}

				if (validStr != "" && validStr.length() > 0) {
					validStr = validStr.trim();
					String[] myStrArr = validStr.split(" ");
					Arrays.sort(myStrArr);

					validStrTemp = validStrTemp.trim();
					int vT = Arrays.binarySearch(myStrArr, validStrTemp);

					if (vT < 0) {
						validStr += " " + validStrTemp;
					}
				} else
					validStr = validStrTemp;
			}
		} catch (FileNotFoundException fExp) {
			System.out.println("Exception: File Not Found - " + fExp);
		} catch (Exception e) {
			System.out.println("Exception - " + e);
		}

		return validStr.trim();
	}

	public String doStrAppend(int tokenLen) {
		String append = "";

		if (tokenLen == 3)
			append = "_ ";
		if (tokenLen == 2)
			append = "__ ";
		if (tokenLen == 1)
			append = "___ ";

		return append;
	}

	public String doAddSlashesString(String serStr) {
		
		serStr=replaceAllString(serStr,"\\","/");
		
		StringBuffer stringbuffer = new StringBuffer();
		if (serStr == null || serStr.length() == 0) {
			return "";
		}

		for (StringTokenizer stringtokenizer = new StringTokenizer(serStr,"'\"", true); stringtokenizer.hasMoreTokens();) {
			String token = stringtokenizer.nextToken();

			if (token.endsWith("'")) {
				stringbuffer.append(token.substring(0, token.length() - 1));
				stringbuffer.append("\\'");
			} else if (token.endsWith("\"")) {
				stringbuffer.append(token.substring(0, token.length() - 1));
				stringbuffer.append("\\\"");
			} else if (token.startsWith("'")) {
				stringbuffer.append("\\'");
				stringbuffer.append(token.substring(token.length() - 1, 0));
			} else if (token.startsWith("\"")) {
				stringbuffer.append("\\\"");
				stringbuffer.append(token.substring(token.length() - 1, 0));
			} else {
				stringbuffer.append(token);
			}
		}
		return stringbuffer.toString();
	}
	
	public String replaceAllString(String strOrig, String strFind, String strReplace) {
		if(strOrig == null) {
		return null;
		}
		StringBuffer sb = new StringBuffer(strOrig);
		String toReplace = "";
		if (strReplace == null) toReplace = "";
		else toReplace = strReplace;
		int pos = strOrig.length();
		while (pos > -1) {
		pos = strOrig.lastIndexOf(strFind, pos);
		if (pos > -1) sb.replace(pos, pos+strFind.length(), toReplace);
		pos = pos - strFind.length();
		}
		return sb.toString();
		}

}
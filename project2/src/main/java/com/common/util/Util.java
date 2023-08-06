package com.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class Util {
	public static int fileDelete(String url, String fileName) {
		int result = 0;
		File file = new File(url + fileName);
		if(file.exists()) {
			if(file.delete()) {
				result = 1;//System.out.println("삭제 성공");
			} else {
				result = 0;//System.out.println("문제 발생");
			}
		}else {
			result = -1;//System.out.println("파일이 없습니다.");
		}
		return result;
	}
	
	public static String makeThumbnail(String filePath, String oriFileName) throws Exception {
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		BufferedImage srcImg = ImageIO.read(new File(filePath + "upFile/" + oriFileName));
		int index = oriFileName.lastIndexOf(".");
		//String fileName = oriFileName.substring(0, index);
		String fileExt = oriFileName.substring(index + 1);
		// 썸네일의 너비와 높이 입니다.
		int dw = 420, dh = 160;      
		// 원본 이미지의 너비와 높이 입니다.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
		int nw = ow; int nh = (ow * dh) / dw;
		// 계산된 높이가 원본보다 높다면 crop이 안되므로
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
		if(nh > oh) {
			nw = (oh * dw) / dh;
			nh = oh;
		}
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		// crop된 이미지로 썸네일을 생성합니다.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
		String thumbName = filePath + "/thumbnail/" + oriFileName;
		File thumbFile = new File(thumbName);
		if(!thumbFile.exists()) {//존재하는지 확인
			thumbFile.mkdirs();//부모경로부터 만들어주기
		}
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
		return oriFileName;
	}
	
	public static String fileSave(String path, MultipartFile file) throws IOException {
		File upFile = new File(path + "/upFile/");
		if(!upFile.exists()) {//존재하는지 확인
			upFile.mkdirs();//부모경로부터 만들어주기
		}
		//유니트한 파일명 만들기 UUID
		String fileName = UUID.randomUUID().toString() 
							+ "_" + file.getOriginalFilename();
		//				fjef-fe92-fenv-feno_bono.png
		upFile = new File(upFile, fileName);
		//올리기
		FileCopyUtils.copy(file.getBytes(), upFile);
		
		return fileName;
	}
	
	//특수문자 제거 <, >
	public static String removeSC(String str) {
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		return str;
	}
	// \n -> <br>
	public static String addBR(String str) {
		return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}
	
	//<br> -> \n
	public static String addSlash(String str) {
		return str.replaceAll("<br>", "\n");
	}
	
	//IP얻어오기
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");	
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	//string -> int
	//  "20A" -> 20
	public static int str2Int(String str) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if(Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		return Integer.parseInt(sb.toString());
	}
	
	public static int str2Int(Object object) {//오브젝트 타입이 들어오면
		return str2Int(String.valueOf(object));
	}
	
	// 30 -> true / 30A -> false
	public static boolean checkNumber(String str) {
		try {
			Integer.parseInt(str);
			return true;		
		} catch (Exception e) {
			return false;
		}		
	}
	
	
}

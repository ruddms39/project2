package com.hair.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.Base64;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class ImageFileTest {
	
	private String getBase64String(MultipartFile multipartFile) throws Exception {
        byte[] bytes = multipartFile.getBytes();
        return Base64.getEncoder().encodeToString(bytes);
    }
	
	
	 public String requestToFlask(String fileName, MultipartFile file) throws Exception {
	      
	       String url = "http://13.54.219.50:5000/detect";
	       RestTemplate restTemplate = new RestTemplate();

	       // Header set
	       HttpHeaders httpHeaders = new HttpHeaders();
	       httpHeaders.setContentType(MediaType.APPLICATION_JSON);

	       // Body set
	       MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
	       String imageFileString = getBase64String(file);
	       body.add("filename", fileName);
	       body.add("image", imageFileString);

	       // Message
	       HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
	       System.out.println("response.getBodyppp()");
	       // Request
	       //HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
	       String response = restTemplate.postForObject(url, requestMessage, String.class);
	       //ResponseEntity<Map> response = restTemplate.exchange("http://127.0.0.1:5000/detect",HttpMethod.POST, requestMessage, String.class);
	       System.out.println(response);
	       JSONParser parser = new JSONParser();
	       JSONObject jsonobject = (JSONObject) parser.parse(response);
	       jsonobject.size();
	       
	       System.out.println("ret size : " +  jsonobject.size());
//	       System.out.println("ret 0 : " +  jsonobject.notifyAll());
	       //System.out.print(jsonobject.get("image"));
	       
	 
	       // create output file									// 작업 다 끝나고 도착할 파일 경로와 이름
	       File outputFile = new File("C:\\Users\\woori\\git\\HairProJect22\\project\\src\\main\\webapp\\resources\\assets\\img\\ret_spring.jpg");
	       byte[] decodedBytes = Base64.getDecoder().decode((String)(jsonobject.get(fileName)));
	       FileUtils.writeByteArrayToFile(outputFile, decodedBytes);
	       
	       return "OK";

	}
	 
	    public void file_transfer(MultipartFile multipartFile) throws Exception{
		 															//얘만 바꾸면 됨(단, 인식이 가능한 사진이어야함)
		 File file = new File("C:\\Users\\woori\\Documents\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\c1.jpg");
	    	
		 DiskFileItem fileItem = new DiskFileItem("file", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length() , file.getParentFile());
		     		       
		 InputStream input = new FileInputStream(file);
		 OutputStream os = fileItem.getOutputStream();
		 IOUtils.copy(input, os);
		     		        
		 MultipartFile multipartFile1 = new CommonsMultipartFile(fileItem);
		 // 플라스크 서버에 보낼 이름 (이름이 다 다르면 사진 계속 쌓임)
	        String ret = requestToFlask("c1.jpg", multipartFile1);
	        System.out.print(ret);

	    }
	}

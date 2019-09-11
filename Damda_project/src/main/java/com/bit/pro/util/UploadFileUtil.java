package com.bit.pro.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import com.bit.pro.controller.ItemController;

//사진 저장하는 폴더생성 및 사진 삽입
public class UploadFileUtil {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtil.class);
  
	 static final int THUMB_WIDTH = 300;
	 static final int THUMB_HEIGHT = 300;
	 
	 public static String fileUpload(String uploadPath,String fileName,byte[] fileData,int count) throws Exception {
		 logger.debug("UploadFileUtil start...");
		 //랜덤이름 생성 DB컬럼이름 photoName
		 
		 UUID uid = UUID.randomUUID();
		 String newFileName = null;
		 if(count==0) {
			 newFileName = "s_" +uid + "_" + fileName;
		 }else {
			 newFileName = "d_" +uid + "_" + fileName;
		 }
		 
		 String imgPath = uploadPath;
		 
		 File dirPath = new File(uploadPath);
		 if (!dirPath.exists()) {
			 dirPath.mkdirs();
		 }
		 
	  	File target = new File(imgPath, newFileName);
	  	FileCopyUtils.copy(fileData, target);
	  	File image = new File(imgPath + File.separator + newFileName);
	  	
		return newFileName;
		  
	 }
}

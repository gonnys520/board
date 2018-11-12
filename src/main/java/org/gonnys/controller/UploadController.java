package org.gonnys.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.gonnys.domain.AttachFileVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/free_board/*")
@Log4j
public class UploadController {
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private String getFolder() {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String str = sdf.format(date);
	return str.replace("-", File.separator);
	}

	
	
	
	
	
	
	@GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName) {
		log.info("download file: " + fileName);
		Resource resource = new FileSystemResource("c:\\upload\\"+fileName);
		
		log.info("resource :" + resource);
		
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		
		//remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			}else if(userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			}else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			log.info("downloadName: "+downloadName);
			
			headers.add("Content-Disposition","attachment; filename=" + downloadName);
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers,HttpStatus.OK);
		
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("file: " + fileName);
		
		File file = new File ("C:\\upload\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
		}catch (IOException e){
			e.printStackTrace();
		}
		return result;
	}
	

	@GetMapping("/uploadform")
	public void uploadForm() {
		
		log.info("upload Form");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("===============================");
			log.info("upload File name:" + multipartFile.getOriginalFilename());
			log.info("upload file size:" + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			}catch (Exception e){
				log.error(e.getMessage());
			}//end catch
		}//end for
		
	}
	
	@GetMapping("/uploadajax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileVO> list = new ArrayList<>();		
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		
		//make folder -------------------------------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path:" + uploadPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//make yyyy/MM/dd folder
		for (MultipartFile multipartFile : uploadFile) {
			
			AttachFileVO attachVO = new AttachFileVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("===============================");
			log.info("upload File name:" + multipartFile.getOriginalFilename());
			log.info("upload file size:" + multipartFile.getSize());
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name: " + uploadFileName);
			attachVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachVO.setUuid(uuid.toString());
				attachVO.setUploadPath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					
					attachVO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					
					thumbnail.close();
				}
				
				list.add(attachVO);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}//end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
}

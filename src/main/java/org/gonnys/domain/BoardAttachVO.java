package org.gonnys.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean fileType;
	
	private Integer bno;
	
}

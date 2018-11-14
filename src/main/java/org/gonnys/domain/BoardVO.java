package org.gonnys.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String mid, title, writer, content, del;
	private Date date_time, update_time;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
	

};

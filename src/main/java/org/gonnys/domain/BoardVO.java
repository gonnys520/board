package org.gonnys.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Integer bno;
	private String mid, title, writer, content;
	private Date date_time, update_time;

}

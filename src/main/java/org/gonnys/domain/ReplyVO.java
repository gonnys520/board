package org.gonnys.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	
	private int rno,bno;
	private String mid,reply,replyer;
	private Date replyDate, updateData;
}

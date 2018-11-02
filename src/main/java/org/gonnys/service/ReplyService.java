package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.ReplyPageDTO;
import org.gonnys.domain.ReplyParam;
import org.gonnys.domain.ReplyVO;

public interface ReplyService {

	public int create(ReplyVO vo);
	
	public ReplyVO read(int rno);
	
	public int remove(int rno);
	
	public int update(ReplyVO reply);
	
//	public List<ReplyVO> getList(ReplyParam param, int bno);
	
	public ReplyPageDTO getListPage(ReplyParam param, int bno);
}

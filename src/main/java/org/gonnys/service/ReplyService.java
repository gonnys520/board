package org.gonnys.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gonnys.domain.PageParam;
import org.gonnys.domain.ReplyVO;

public interface ReplyService {

	public int create(ReplyVO vo);
	
	public ReplyVO read(int rno);
	
	public int delete(int bno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getList(PageParam param, int bno);
}

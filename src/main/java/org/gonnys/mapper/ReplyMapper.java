package org.gonnys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gonnys.domain.PageParam;
import org.gonnys.domain.ReplyVO;

public interface ReplyMapper {

	public int create(ReplyVO vo);
	
	public ReplyVO read(int rno);
	
	public int remove(int rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getList(
			@Param("param") PageParam param,
			@Param("bno")int bno);
	

}

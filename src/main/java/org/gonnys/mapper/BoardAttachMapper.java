package org.gonnys.mapper;

import java.util.List;

import org.gonnys.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Integer bno);
	
	public void removeAll(int bno);
	
}

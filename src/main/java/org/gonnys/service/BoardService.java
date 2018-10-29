package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardVO;

public interface BoardService {

	//getList
	public List<BoardVO> getList();
	
	//Write
	public void write(BoardVO board);

	//Read
	public BoardVO read(Integer bno);
	
	//Remove
	public int remove(Integer bno);
	
	//Modify
	public int modify(BoardVO board);

}

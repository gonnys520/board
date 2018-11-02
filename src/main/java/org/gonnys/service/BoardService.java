package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;

public interface BoardService {

	//getList
	public List<BoardVO> getList(PageParam param);
	
	//Write
	public int write(BoardVO board);

	//Read
	public BoardVO read(PageParam param);
	
	//Remove
	public int remove(PageParam param);
	
	//Modify
	public int modify(BoardVO board);
	
	//count
	public int getTotal();

}

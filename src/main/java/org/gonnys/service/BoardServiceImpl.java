package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;
import org.gonnys.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	
	
	@Override
	public List<BoardVO> getList(PageParam param) {
	
		log.info("get list.............");
		
		return mapper.getList(param);
	}

	@Override
	public void write(BoardVO board) {
		
		log.info("write.............");
		
		mapper.write(board);
	}

	@Override
	public BoardVO read(PageParam param) {
		
		log.info("read.............");
		
		return mapper.read(param);
	}

	@Override
	public int remove(PageParam param) {
		
		log.info("remove.............");
		
		return mapper.remove(param);
	}

	@Override
	public int modify(BoardVO board) {
		
		log.info("modify.............");
		
		return mapper.modify(board);
	}

	@Override
	public int getTotal() {
		return mapper.count();
	}

}

package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardVO;
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
	public List<BoardVO> getList() {
	
		log.info("get list.............");
		
		return mapper.getList();
	}

	@Override
	public void write(BoardVO board) {
		
		log.info("write.............");
		
		mapper.write(board);
	}

	@Override
	public BoardVO read(Integer bno) {
		
		log.info("read.............");
		
		return mapper.read(bno);
	}

	@Override
	public int remove(Integer bno) {
		
		log.info("remove.............");
		
		return mapper.remove(bno);
	}

	@Override
	public int modify(BoardVO board) {
		
		log.info("modify.............");
		
		return mapper.modify(board);
	}

}

package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardAttachVO;
import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;
import org.gonnys.mapper.BoardAttachMapper;
import org.gonnys.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	@Override
	public List<BoardVO> getList(PageParam param) {
	
		log.info("get list.............");
		
		return mapper.getList(param);
	}

	@Transactional
	@Override
	public int write(BoardVO board) {
		
		log.info("write............."+board);
		
		int result = mapper.write(board);
		
		mapper.insertSelectKey(board);
		
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return result;
		}
		
		board.getAttachList().forEach(attach -> {
			
			log.info(board);
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
		return result;
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

	@Override
	public List<BoardAttachVO> getAttachList(Integer bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}

}

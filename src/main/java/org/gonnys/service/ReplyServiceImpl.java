package org.gonnys.service;

import java.util.List;

import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;
import org.gonnys.domain.ReplyVO;
import org.gonnys.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper mapper;

	@Override
	public int create(ReplyVO vo) {
		log.info("create................!");
		return mapper.create(vo);
	}

	@Override
	public ReplyVO read(int rno) {
		
		log.info("read......................");
		return mapper.read(rno);
	}

	@Override
	public int remove(int rno) {
		log.info("delete..................");
		return mapper.remove(rno);
	}

	@Override
	public int update(ReplyVO reply) {
		log.info("update..............");
		return mapper.update(reply);
	}

	@Override
	public List<ReplyVO> getList(PageParam param, int bno) {
		log.info("get Reply Lisr of a Board" + bno);
		return mapper.getList(param, bno);
	}


}

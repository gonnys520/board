package org.gonnys.mapper;

import java.util.List;

import org.gonnys.domain.PageParam;
import org.gonnys.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {

	private static final Integer[] bnoArr = null;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info("Mapper: " + mapper);
	}
	
	
	@Test
	public void InsertTest() {
	
		ReplyVO vo = new ReplyVO();
		
		vo.setBno(1577);
		vo.setReply("댓글 테스트");
		vo.setReplyer("나 자신");

		mapper.create(vo);
	}
	
	@Test
	public void ReadTest() {
	
		Integer rno = 1;
		ReplyVO vo = mapper.read(rno);
		
		log.info(vo);
	}
	
	@Test
	public void DeleteTest() {
	
		Integer rno = 1;
		
		log.info(mapper.delete(rno));
	}
	
	@Test
	public void UpdateTest() {
		Integer rno = 2;
		ReplyVO vo = mapper.read(rno);
		vo.setReply("Update Reply");
		int count = mapper.update(vo);
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testList() {
		PageParam param = new PageParam();
		List<ReplyVO> replies = mapper.getList(param, 1577);
		replies.forEach(reply -> log.info(reply));
	}
	
	
}

//package org.gonnys.service;
//
//import org.gonnys.domain.BoardVO;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@Log4j
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//public class BoardServiceTests {
//
//	@Setter(onMethod_ = @Autowired)
//	private BoardService service;
//	
//	
//	@Test
//	public void testGetList() {
//		
//		log.info("getList.................");
//		
//		service.getList().forEach(board -> log.info(board));
//	}
//	
//	
//	@Test
//	public void testWrite() {
//		
//		BoardVO board = new BoardVO();
//		board.setTitle("junit write test");
//		board.setContent("잘됐으면 좋.겠.다");
//		board.setWriter("멍멍이");
//		
//		service.write(board);
//		
//		log.info(board);
//	}
//	
//	
//	@Test
//	public void testRead() {
//			
//		log.info(service.read(3));
//	}
//	
//	
//	@Test
//	public void testModify() {
//		
//		BoardVO board = new BoardVO();
//		board.setBno(10);
//		board.setTitle("juit 수정 테스트입니다~~");
//		board.setContent("잘나온다면 손을 들어주세여....하잇!");
//		
//		service.modify(board);
//		
//		log.info(board);
//	}
//
//	
//	@Test
//	public void testRemove() {
//		
//		log.info(service.remove(9));
//	}
//	
//}

package org.gonnys.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BoardControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders
				.get("/free_board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	@Test
	public void testWrite() throws Exception {
		
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/free_board/write")
				.param("title", "컨트롤러 테스트 중!")
				.param("content", "한번에 성공하자...")
				.param("writer", "ggony")
				).andReturn().getModelAndView().getViewName();
		
		log.info(result);
	}
	
	@Test
	public void testRead() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/free_board/read")
						.param("bno", "46"))
						.andReturn()
						.getModelAndView().getModelMap());
	}
	
	
	@Test
	public void testRemove() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/free_board/remove")
						.param("bno", "44"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(result);
	}
	
	@Test
	public void testModify() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/free_board/modify")
				.param("bno", "43")
				.param("title", "컨트롤러 modify 테스트중!")
				.param("content", "한방에 딱딱!"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(result);
	}
	

}

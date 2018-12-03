package org.gonnys.controller;

import java.util.List;

import org.gonnys.domain.BoardAttachVO;
import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;
import org.gonnys.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

	@Controller
	@RequestMapping("/board/*")
	@AllArgsConstructor
@Log4j
public class BoardController {

	private BoardService service;
	
	//泥⑤��뙆�씪 read
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Integer bno){
		
		log.info("getAttachList " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
		
	}
	
	
	
	
	
	
	@GetMapping("/list")
	public void list(@ModelAttribute("pageObj") PageParam pageParam, Model model){

		pageParam.setTotal(service.getTotal());
		model.addAttribute("list", service.getList(pageParam));	
	}

	
	@PostMapping("/write")
	public String writePOST(BoardVO board, RedirectAttributes redirect) {
		
		log.info("==============write 1");
		log.info("write: " + board);
		
		if (board.getAttachList() != null) {
			
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("================write 2");
		
		int result = service.write(board);
		log.info("result :" + result);
		
		//redirect.addFlashAttribute("result", service.write(board));
		redirect.addFlashAttribute("result", result == 1? "SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/write", "/modify"})
	public void read(@ModelAttribute("pageObj") PageParam pageParam, Model model) {
		
		model.addAttribute("board", service.read(pageParam));
	}
	
	@PostMapping("/remove")
	public String remove(PageParam pageParam, RedirectAttributes redirect) {
		
		int count = service.remove(pageParam);
		redirect.addFlashAttribute("result", count == 1? "success" : "fail");
		
		return "redirect:/board/list?page="+pageParam.getPage();
	}
	

	@PostMapping("/modify")
	public String modifyPOST(PageParam pageParam, BoardVO board, RedirectAttributes redirect) {
		
		redirect.addFlashAttribute("result", service.modify(board) ==1?"SUCCESS":"FAIL");
		
		return pageParam.getLink("redirect:/board/read/");
	}
	
	

};

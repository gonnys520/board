package org.gonnys.controller;

import java.io.File;

import org.gonnys.domain.BoardVO;
import org.gonnys.domain.PageParam;
import org.gonnys.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/free_board/*")
@AllArgsConstructor
@Log4j
public class BoardController {

	private BoardService service;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("pageObj") PageParam pageParam, Model model){

		pageParam.setTotal(service.getTotal());
		model.addAttribute("list", service.getList(pageParam));	
	}

	
	@PostMapping("/write")
	public String writePOST(BoardVO board, RedirectAttributes redirect) {
		
		service.write(board);
		redirect.addFlashAttribute("result", board.getBno());
		
		return "redirect:/free_board/list";
	}
	
	@GetMapping({"/read", "/write", "/modify"})
	public void read(@ModelAttribute("pageObj") PageParam pageParam, Model model) {
		
		model.addAttribute("board", service.read(pageParam));
	}
	
	@PostMapping("/remove")
	public String remove(PageParam pageParam, RedirectAttributes redirect) {
		
		int count = service.remove(pageParam);
		redirect.addFlashAttribute("result", count == 1? "success" : "fail");
		
		return "redirect:/free_board/list?page="+pageParam.getPage();
	}
	

	@PostMapping("/modify")
	public String modifyPOST(PageParam pageParam, BoardVO board, RedirectAttributes redirect) {
		
		redirect.addFlashAttribute("result", service.modify(board) ==1?"SUCCESS":"FAIL");
		
		return pageParam.getLink("redirect:/free_board/read/");
	}
	
	

}

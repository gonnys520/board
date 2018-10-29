package org.gonnys.controller;

import org.gonnys.domain.BoardVO;
import org.gonnys.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/free_board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model){
		
		model.addAttribute("list", service.getList());	
	}
	
	@GetMapping("/write")
	public void writeGET() {
	
	}
	
	@PostMapping("/write")
	public String writePOST(BoardVO board, RedirectAttributes redirect) {
		
		service.write(board);
		redirect.addFlashAttribute("result", board.getBno());
		
		return "redirect:/free_board/list";
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("bno") Integer bno, Model model) {
		
		model.addAttribute("read", service.read(bno));
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Integer bno, RedirectAttributes redirect) {
		 
		service.remove(bno);
		redirect.addFlashAttribute("result", "success");
		
		return "redirect:/free_board/list";
	}
	
	@GetMapping("/modify")
	public void modifyGET() {
		
	}
	
	@PostMapping("/modify")
	public String modifyPOST(BoardVO board, RedirectAttributes redirect) {
		
		redirect.addFlashAttribute("result", service.modify(board) ==1?"SUCCESS":"FAIL");
		
		return "redirect:/free_board/read/bno=" + board.getBno();
	}
}

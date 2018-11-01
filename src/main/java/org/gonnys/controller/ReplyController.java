package org.gonnys.controller;

import java.util.List;

import org.gonnys.domain.PageParam;
import org.gonnys.domain.ReplyVO;
import org.gonnys.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	////////////////////////////////////////////////////////////////////////
	
	
	//CREATE
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO: " +vo);
		
		int createCount = service.create(vo);
		
		log.info("reply create count:" + createCount);
		
		return createCount == 1? new ResponseEntity<>("success", HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//GET LIST
	@GetMapping(value= "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_ATOM_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page")int page,
			@PathVariable("bno")int bno){
		
		log.info("get List.............");
		PageParam param = new PageParam();
		log.info(param);
		
		return new ResponseEntity<>(service.getList(param, bno), HttpStatus.OK);
	}
	
	
	//READ
	@GetMapping(value = "/{rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno){
		
			log.info("get: " + rno);
		
		return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
	}
	
	
	//Delete
	@DeleteMapping
	public ResponseEntity<String> delete(@PathVariable("rno") int rno) {
		log.info("delete:" + rno);
		
		return service.delete(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//Update
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value="/{rno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	
	public ResponseEntity<String> update(@RequestBody ReplyVO vo, @PathVariable("rno") int rno){
		
		vo.setRno(rno);
		
		log.info("rno:" + rno);
		log.info("update: " + vo);
		
		return service.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
}

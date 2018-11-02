package org.gonnys.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageParam {

	private int page;
	private int display;
	
	private int total, start, end, bno;
	private boolean prev, next;
	
	private String[] types;
	private String type;
	private String keyword;
	
	
	
	
	public PageParam() {
		this.page = 1;
		this.display = 10;
		this.type = "";
		this.keyword = "";
	}
		

	public void setTotal(int total) {
		this.total = total;
		this.end = (int) (Math.ceil(this.page / 10.0)) * 10;
		this.start = this.end - 9;
		
		if((this.end * 10) > total) {
			this.end = (int) (Math.ceil(total / 10.0));
			this.next = false;
		} else {
			this.next = true;
		}
		
		this.prev = this.start != 1;
	}
	
	public void setType(String type) {
		
		this.type = type;
		if (type == null || type.trim().length() == 0) {
			return;
		}
		this.types = type.split("");
	}
	
	public int getSkip() {
		return (this.page -1) * 10;
	}
	
	
	public String getLink(String path) {
		return UriComponentsBuilder.fromPath(path)
				.queryParam("bno", this.bno)
				.queryParam("page", this.page)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword)
				.toString();
	}
	
}

package org.gonnys.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageParam {

	private int page;
	private int display;
	
	private int total, start, end, bno;
	private boolean prev, next;
	
	
	public PageParam() {
		this.page = 1;
		this.display = 10;
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
	
	public int getSkip() {
		return (this.page -1) * 10;
	}
	
	
	public String getLink(String path) {
		return UriComponentsBuilder.fromPath(path)
				.queryParam("bno", this.bno)
				.queryParam("page", this.page)
				.toString();
	}
	
}

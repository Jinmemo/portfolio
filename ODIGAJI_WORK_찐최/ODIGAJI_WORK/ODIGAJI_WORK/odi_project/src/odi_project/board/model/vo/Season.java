package odi_project.board.model.vo;

import lombok.Builder;
import lombok.Data;

@Builder
@Data

public class Season {
	
	private String season1; //봄
	private String season2; //여름
	private String season3; //가을
	private String season4; //겨울
	
	
	public Season(String season1, String season2, String season3, String season4) {
		super();
		this.season1 = season1;
		this.season2 = season2;
		this.season3 = season3;
		this.season4 = season4;
	}
	
	
	
	

}

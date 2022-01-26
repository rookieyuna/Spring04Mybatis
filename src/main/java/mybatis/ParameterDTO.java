package mybatis;

import lombok.Data;

@Data
public class ParameterDTO {

	private String user_id; //사용자아이디
	private String board_idx; //게시판일련번호
	
	//검색어 처리를 위한 멤버변수
	private String searchField;//검색할 필드명
	private String searchTxt;//검색어
	
	//select구간(페이징)을 위한 멤버변수
	private int start; //게시물 구간 시작
	private int end;//게시물 구간 끝
	

	
	
}

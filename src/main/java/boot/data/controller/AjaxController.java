package boot.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.data.Dto.SangpumDto;
import boot.data.mapper.SangpumMapperInter;
import boot.data.service.SangpumService;

@RestController
public class AjaxController {
	
	@Autowired
	SangpumService service;

	@Autowired
	SangpumMapperInter mapperInter;

	@GetMapping("/ajaxlist")
		public List<SangpumDto> getPagingList(String option, String search, int startnum, int perpage) {
		Map<String, Object> map = new HashMap<>();
		
		int perPage = 8; // 한페이지당 보여질 글의 갯수
		int totalCount = service.getTotalCount(option, search);
		int totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지수
		
		
		map.put("option", option);		// 검색 옵션 설정
		map.put("search", search);		// 검색 단어
		map.put("startnum", startnum);	// 페이지 시작번호
		map.put("perpage", perpage);	// 페이지당 출력할 게시글 수
		
		return mapperInter.getPagingList(map);
	}
	
	// 메모장 삭제부분 참고
	@GetMapping("/ajaxaddr")
	public List<SangpumDto> AjaxPaging(@RequestParam(defaultValue = "allAddr") String j_addr, int startnum, int perpage) {
	Map<String, Object> map = new HashMap<>();
	
	int perPage = 8; // 한페이지당 보여질 글의 갯수
	int totalCount = service.getMainCount();
	int totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 총 페이지수
	
	map.put("j_addr", j_addr);
	map.put("startnum", startnum);	// 페이지 시작번호
	map.put("perpage", perpage);	// 페이지당 출력할 게시글 수
	map.put("totalPage", totalPage);
	return mapperInter.AjaxPaging(map);
}
}

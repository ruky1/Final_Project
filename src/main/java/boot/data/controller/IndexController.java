package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.Dto.MessageRoomDto;
import boot.data.Dto.SangpumDto;
import boot.data.Dto.SearchSaveDto;
import boot.data.mapper.SearchMapperInter;
import boot.data.service.MessageRoomService;
import boot.data.service.SangpumService;
import boot.data.service.UserService;

@Controller
public class IndexController {
	
	@Autowired
	UserService uservice;
	
	@Autowired
	SangpumService sangservice;
	
	@Autowired
	MessageRoomService roomservice;
	
	@Autowired
	SearchMapperInter inter;
	

	@GetMapping("/")
	public ModelAndView index(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "option", required = false) String option, 
			@RequestParam(value = "search", required = false) String search, 
			@ModelAttribute SangpumDto dto,
			HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		
		int totalCount;
		int totalPage; // 총 페이지수
		int startPage; // 각블럭에서 보여질 시작페이지
		int endPage; // 각블럭에서 보여질 끝페이지
		int startNum; // db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage = 8; // 한페이지당 보여질 글의 갯수
		int perBlock = 5; // 한블럭당 보여질 페이지 개수
		
		startNum = (currentPage - 1) * perPage;
		List<SangpumDto> list = sangservice.getPagingList(option, search, startNum, perPage);
		totalCount = list.size();
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;
		
		if (endPage > totalPage)
			endPage = totalPage;
		
		startNum = (currentPage - 1) * perPage;
		
		int no = totalCount - (currentPage - 1) * perPage;
		
		
		model.addObject("list", list);
		model.addObject("totalCount", totalCount);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);	
		
		model.setViewName("/1/layout/main");
		return model;
	}
	
	@GetMapping("/detail")
	public String index2() {
		return"/2/detail/detail";
	}
	
	
	@GetMapping("/insert")
	public String insert() {
		return"/2/sangpum/s_insert";
	}
	
	@PostMapping("/createRoom")
	@ResponseBody
	public int createRoom(@RequestParam int sangidx, HttpSession session){
		
		String sender_id= (String)session.getAttribute("myid");
		//중고상품판매자의 user_num을 찾을 수 있도록 수정해야 됨
		String seller_id = sangservice.getSangpumById(sangidx).getMember_id();//"test2"
		
		//현재 채팅을 보내려는 사용자가 판매자이면 방을 생성할 수 없음
		if(sender_id.equals(seller_id)) {
			return 0;
		}else {
			//기존에 존재하는 채팅방이라면 그곳으로 이동
			String room = roomservice.getRoomBySangIdxAndUserId(sangidx, sender_id);
			System.out.println(room);
			
			if(room!=null) {
				return Integer.parseInt(room);
			}else {//없다면 새로 방 생성후 생성된 방으로 이동
				
				MessageRoomDto newroom = new MessageRoomDto();
				newroom.setJ_sangid(sangidx);
				newroom.setSender_id(sender_id);
				newroom.setReceiver_id(seller_id);
				roomservice.insertRoom(newroom);
				return roomservice.getMaxRoom();
				
			}
			
		}
		
		
	}
	@GetMapping("/search")
	public ModelAndView index3(@RequestParam String s_id) {
		
		ModelAndView model=new ModelAndView();
		
		List<SearchSaveDto> list=inter.searchSave(s_id);
		List<String> title=inter.bestsearch();
		
		model.addObject("list", list);
		model.addObject("title", title);
		model.setViewName("/3/search2/search2");
		return model;
	}
	
	@PostMapping("/adminPage")
	public String adminIndex() {
		return"/admin/layout-admin/admin_main/admin_main";
	}
	
	
	
}

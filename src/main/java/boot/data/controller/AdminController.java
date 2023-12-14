package boot.data.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.Dto.AdminLoginDto;
import boot.data.Dto.LoginDto;
import boot.data.Dto.NoticeDto;
import boot.data.Dto.SangpumDto;
import boot.data.Dto.UserDto;
import boot.data.service.AdminService;


@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	
	@GetMapping("/admin")
	public String adminIndex(HttpSession session, Model model) {
	
				//로그인인지 아닌지 판단
				String adminloginok=(String)session.getAttribute("a_loginok");
				
				 
				//한번도 실행안하면 null
				if(adminloginok==null) {
				
					return "/3/adminlogin/adminLoginForm";
				}
				model.addAttribute("t_u_l_count", service.adminTodayLogin());
				model.addAttribute("y_u_l_count", service.adminYesterdayLogin());
				model.addAttribute("w_u_l_count", service.adminWeekLogin());
				return "/admin/layout-admin/admin_main/admin_main";
	}
	
	@PostMapping("/adminPage_action")
	public ModelAndView loginproc(@RequestParam String a_id, @RequestParam String a_pass,@RequestParam(required = false) String savechk,HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		HashMap<String, String>map=new HashMap<>();
		int check=service.adminLoginPassCheck(a_id, a_pass);
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			session.setAttribute("a_id", a_id);
			session.setAttribute("a_loginok", "ok");
			
			AdminLoginDto a_dto= service.getAdminID(a_id);
			session.setAttribute("a_email",a_dto.getA_email());
			session.setAttribute("a_right",a_dto.getA_right());
			session.setAttribute("a_hp", a_dto.getA_hp());
			session.setAttribute("a_name",a_dto.getA_name());
			model.addObject("t_u_l_count", service.adminTodayLogin());
			model.addObject("y_u_l_count", service.adminYesterdayLogin());
			model.addObject("w_u_l_count", service.adminWeekLogin());
			
			model.setViewName("/admin/layout-admin/admin_main/admin_main");
			return model;
		}
		model.setViewName("/3/adminlogin/passFail");
		return model;
	}
	
	@GetMapping("/adminlogoutprocess")
	public String a_logout(HttpSession session) {
		session.removeAttribute("a_loginok");
		session.removeAttribute("a_id");
		session.removeAttribute("a_pass");
		session.removeAttribute("a_email");
		session.removeAttribute("a_right");
		session.removeAttribute("a_hp");
		session.removeAttribute("a_name");
		
		
		return "redirect:/";
	}
	
	
	@GetMapping("/notice")
	public String main(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		int totalCount = service.getTotalNoticeCount();

		model.addAttribute("totalCount", totalCount);

		// 페이징 처리에 필요한 변수처리

		int totalPage; // 총 페이지수
		int startPage; // 각블럭에서 보여질 시작페이지
		int endPage; // 각블럭에서 보여질 끝페이지
		int startNum; // db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage = 10; // 한페이지당 보여질 글의 갯수
		int perBlock = 5; // 한블럭당 보여질 페이지 개수

		// 총페이지수 구하기
		// 총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		// 나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

		// 각블럭당 보여야할 시작페이지
		// perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		// 현재페이지 13 시작:11 끝:15
		startPage = (currentPage - 1) / perBlock * perBlock + 1;

		endPage = startPage + perBlock - 1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다
		if (endPage > totalPage)
			endPage = totalPage;

		// 각페이지에서 보여질 시작번호
		// 1페이지: 0,2페이지:5 3페이지:10....
		startNum = (currentPage - 1) * perPage;

		// System.out.println(endPage);
		// 각페이지당 출력할 시작번호 구하기 no
		// 총글개수가 23이면 1페이지 23,2페이지는 18,3페이지 13.....
		// 출력시 1씩 감소하며 출력
		
		List<NoticeDto>list=service.getAllNoticeList(startNum, perPage);
		// 각 페이지에 출력할 시작번호
				int no = totalCount - (currentPage - 1) * perPage;

				model.addAttribute("totalCount", totalCount);
				model.addAttribute("list", list);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("no", no);
				model.addAttribute("currentPage", currentPage);
		
		return "/admin/admin/notice/notice_listForm";
	}
	
	@GetMapping("/n_addform")
	public String n_add() {
		return "/admin/admin/notice/notice_addForm";
	}
	
	@PostMapping("/a_notice_insert")
	public ModelAndView a_notice_add(@ModelAttribute NoticeDto n_dto) {
		ModelAndView model = new ModelAndView();
		service.insertNotice(n_dto);
		
		model.setViewName("redirect:notice");
		return model;
	}
	
	
	@ResponseBody
	@GetMapping("/a_notice_num")
	public Map<String, Object> a_notice_num(@RequestParam int num) {
		
		Map<String, Object>returnMap=new HashMap<>();
		NoticeDto n_dto = service.getNoticeNum(num);
		AdminLoginDto a_dto = service.getAdminID(n_dto.getN_id());
		
		returnMap.put("n_num", n_dto.getN_num());
		returnMap.put("n_email", a_dto.getA_email());
		returnMap.put("n_name", n_dto.getN_name());
		returnMap.put("n_title", n_dto.getN_title());
		returnMap.put("n_content", n_dto.getN_content());
		returnMap.put("n_registration_date", n_dto.getN_registration_date());
		returnMap.put("n_hits", n_dto.getN_hits());
		returnMap.put("n_id", n_dto.getN_id());
		
		return returnMap;
	}
	
	@PostMapping("a_notice_update")
	public ModelAndView a_notice_correction(@ModelAttribute NoticeDto n_dto) {
		ModelAndView model = new ModelAndView();
		service.updateNotice(n_dto);
		
		model.setViewName("redirect:notice");
		return model;
	}
	
	
	@GetMapping("/notice_delete")
	public String noticeDelete(@RequestParam int num) {
		
		service.deleteNotice(num);
		
		return "redirect:notice";
	}
	
	
	@GetMapping("/information")
	public ModelAndView information() {
		List<LoginDto> list = new ArrayList<>();
		ModelAndView model= new ModelAndView();
		 
		list= service.failuser();  //페일카운트 잇는 유저 전부호출
		
		 model.addObject("list",list);
	
		
		 model.setViewName("/admin/admin/member_information/listForm");
		 return model;
	}
	@GetMapping("/failreset")
	public String failreset(@RequestParam String u_id) {
		
		service.failreset(u_id); // 버튼누르면 페일카운트 10개인사람을 페일카운트0으로 초기화
		return "redirect:information";
	}
	
	@GetMapping("/a_userlist")
	public String a_userlist(Model model,HttpSession session) {
		List<UserDto> list = new ArrayList<>();
		list= service.userList(); 
		
		model.addAttribute("list",list);
		model.addAttribute("a_write",session.getAttribute("a_write"));
		 return "/admin/admin/user/list";

	}
	
	
	@GetMapping("/a_sale")
	public String a_sale(Model model){
		List<SangpumDto>list=service.adminSale();
		model.addAttribute("list",list);
		
		
		return "/admin/admin/sales_data/listForm";
	}
	
	@GetMapping("/a_sale_completed")
	public String a_sale_completed(Model model){
		List<SangpumDto>list=service.adminSaleComplete();
		model.addAttribute("list",list);
		return "/admin/admin/sales_data/completelistForm";
	}
	
	@GetMapping("user_delete")
	public String user_delete(@RequestParam String num){
		service.deleteUser(num);
		
		return "redirect:a_userlist";
		
	}
	@GetMapping("fail_a_id")
	public String fall_a_id() {
		return "/3/fail/a_id_fail";
	}
	
	
	
}

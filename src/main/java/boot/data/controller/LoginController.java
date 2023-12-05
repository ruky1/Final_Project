package boot.data.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import boot.data.Dto.LoginDto;
import boot.data.mapper.InterestMapperInter;
import boot.data.mapper.PurchaseMapperInter;
import boot.data.mapper.SangpumMapperInter;
import boot.data.service.LoginService;
import boot.data.service.SangpumService;
import boot.data.service.SangpumServiceInter;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class LoginController {
	
	@Autowired
	PurchaseMapperInter purchaseinter;
	
	@Autowired
	InterestMapperInter interstinter;
	
	@Autowired
	LoginService service;
	
	
	@Autowired
	SangpumService sangService;
	
	//로그인폼으로
	@GetMapping("/loginform")
	public String loginform()
	{
		return "/2/login/loginform";
	}
	//회원가입폼으로
	@GetMapping("/joinform")
	public String joinform()
	{
		return "/2/login/joinform";
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(@ModelAttribute LoginDto login,
			HttpSession session,
			Model model)
	{
		model.addAttribute("login",login);
		 // u_id 중복 확인
	    if (service.getSerchId(login.getU_id())) {
	        
	    	//중복잇고 카카오 잇는경우
	        if(login.getU_id().contains("카카오")) {
	        	return "login";
	        }
	        
	        else {
	        	//db에 중복된 경우
		        model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	        	return "/2/login/joinform"; // 가입폼으로 리다이렉트
	        }
	    
	    }
	    
	    else {
	        //db에 어떠한 중복이 없는 경우
	        service.insertMember(login);
	        
	        //db에 중복없고 가입한값이 카카오 
		      if(login.getU_id().contains("카카오")){
		    	   return "login";
		       }
	        
	        
	        return "/2/login/gaipsuccess"; // 가입 성공 페이지로 리다이렉트
	 
	    }
	}
	
	
	
		//로그인시 메인화면 이동
		@GetMapping("/main")
		public String loginform(HttpSession session, Model model)
		{	
			//폼의 아이디 얻기
			String u_id=(String)session.getAttribute("u_id");
			
			//로그인 상태인지 아닌지 체크
			String loginok = (String)session.getAttribute("loginok");
			
			//학번도 실행안하면 null
			if(loginok==null)
				return "/2/login/loginform";
			else {
				//로그인중이면 request에 name 저장
				String u_name = service.getName(u_id);
				model.addAttribute("u_name", u_name);
				
				return "/";
			}
			
			
		}
		
		@PostMapping("/login")
		@ResponseBody
		public String loginproc(@RequestParam String u_id,
				@RequestParam String u_pass,
				HttpSession session)
		{
			HashMap<String, String> map = new HashMap<>();
			
			int check = service.loginPassCheck(u_id, u_pass);
			boolean idcheck = service.getSerchId(u_id);
			int failcheck =0;
			if (idcheck) {failcheck = service.failcheck(u_id);
			}
			
			System.out.println(service.getSerchId(u_id));
			
			if(check==1 && failcheck<10) {
				session.setMaxInactiveInterval(60*60*1); //1시간
				session.setAttribute("myid", u_id);
				session.setAttribute("loginok", "yes");
				
				LoginDto login = service.getDataById(u_id);
				session.setAttribute("myname", login.getU_name());
				session.setAttribute("myhp", login.getU_hp());
				session.setAttribute("myemail", login.getU_email());
				
				service.failreset(u_id);
				
				session.removeAttribute("findid");
				
				return "success";
			}else if(check==1 && failcheck>=10) {
				return "lock";
			}else if(check==0&& failcheck>=5 && failcheck<=9) {
				service.failcount(u_id);
				return "quiz";
			}else if(!idcheck) {
				return "none";
			}
			  else {
		    	service.failcount(u_id);
		        return "fail";
		    }
		
		}
		
		@GetMapping("/logoutprocess")
		public String logout(HttpSession session)
		{
			session.removeAttribute("loginok");
			session.removeAttribute("myid");
			session.removeAttribute("myname");
			session.removeAttribute("myhp");
			session.removeAttribute("myemail");
			
			return "redirect:main";
		}
		@GetMapping("/idsearch")
		public String idsearch()
		{
			return "/2/login/findidform";
		}
		
		//로그인페이지에서 비밀번호 찾기버튼 눌러서 폼으로 이동하기
		@GetMapping("/pwsearch")
		public String pwsearch()
		{
			return "/2/login/findpwform";
		}
		
		
		
		//비밀번호 찾기폼에서 인증번호 확인되면 새로운비밀번호설정폼으로 이동시킴
		@PostMapping("/findpw")
		public ModelAndView findpw(@RequestParam String u_id,
				@RequestParam String u_hp,
				@RequestParam String otp, //입력칸
				HttpSession session
				)
		{
			ModelAndView model = new ModelAndView();
			HashMap<String, String> map = new HashMap<>();
			
			
			service.findpwstart(u_id, u_hp);
			
			 String innum=String.valueOf(session.getAttribute("innum"));
			 //System.out.println(innum);
			 //System.out.println(otp);
			 
			 
			 if(otp.equals(innum)) {
				 model.addObject("u_id", u_id);
				model.setViewName("/2/login/findpwform2");
			 }
				else {
					model.setViewName("redirect:/2/login/findpwform");
				}
				
			return model;
		}
		
		//버튼눌럿을때 인증번호 받고 체크
		@PostMapping("/checkuserinfo")
		@ResponseBody
		public String checkuserinfo(@RequestParam String u_id,
		@RequestParam String u_hp,
		HttpSession session)
		{
		
		int codecheck=service.findpwstart(u_id, u_hp);
		
		if(codecheck==1) {
			int innum = service.randomnum();
			
			
			//coolsms 문자
			DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCS95BFETLQ3QNUG", "3M5CKRRS4JLB6WMHYLEIEJIQFP1YWLSB", "https://api.coolsms.co.kr/");
					// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
					Message message = new Message();
					message.setFrom("01036121425"); //01036121425
					message.setTo(u_hp);
					message.setText("[4B]인증번호"+innum+"입니다."); 
					
					session.setAttribute("innum",innum);

				try {
					  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
					  messageService.send(message);
					} catch (NurigoMessageNotReceivedException exception) {
					  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
					  System.out.println(exception.getFailedMessageList());
					  System.out.println(exception.getMessage());
					} catch (Exception exception) {
					  System.out.println(exception.getMessage());
					}
					
			return "match";
		}
		else {
			return "fail";
		}
		
		}
		

		
		//비밀번호 설정폼에서 버튼누르면 새로운비밀번호로 변경
		@PostMapping("/pwupdate")
		@ResponseBody
		public String pwupdate(@RequestParam String u_id,
				@RequestParam String pass1,
				@RequestParam String pass2
				)
		{
			String u_pass = pass1;
			//System.out.println(u_id);
			if(pass1.equals(pass2)) {
				service.pwchange(u_id,u_pass);
				return "success";
			}
			else {
				return "fail";
			}
		}
			
		
		
		
		@PostMapping("/findid")
		public String findid(@RequestParam String u_name,
				@RequestParam String u_email,
				@RequestParam String u_hp,
				HttpSession session)
		{
			HashMap<String, String> map = new HashMap<>();
			int check = service.findIdCheck(u_name, u_email,u_hp); //u_name ,u_email,u_hp
			String findid= service.getId(u_name, u_email, u_hp);
			//System.out.println(check);
			//System.out.println(findid);
			if(check==1) {
				
				session.setAttribute("findid", findid);
				
				return "/2/login/findidsuccess";
			}else {
			return "/2/login/findidform";
			}
		}
	
	//마이페이지
	@GetMapping("/mypage")
	public ModelAndView mypage(String u_id) {
		ModelAndView model = new ModelAndView();
		
		LoginDto dto = service.getDataById(u_id);
		int likes = interstinter.countlikes(u_id);
		int purchase = purchaseinter.countpurchase(u_id);
		int sell = purchaseinter.countIdOfsell(u_id);
		int sellcomplete = purchaseinter.countsellcomplete(u_id);
		
		//판매 상품 완료 건수 구해서 연필 색상 구하기
		int count = sangService.salesCount(u_id);
		String color ="";
		if(count<=5)
			color =  "red";
		else if(count > 5 && count <=10)
			color = "orange";
		else if(count > 10 && count <=20)
			color = "blue";
		else
			color = "purple";
		
		model.addObject("sellcomplete", sellcomplete);
		model.addObject("sell", sell);
		model.addObject("purchase", purchase);
		model.addObject("likes", likes);
		model.addObject("dto", dto);
		model.addObject("color",color);
		model.setViewName("/2/login/mypage");
		
		return model;
	}
	
	//회원정보 데이터 가져오기
	@GetMapping("/updateform")
	public ModelAndView updateform(String u_id) {
		ModelAndView model = new ModelAndView();
		
		LoginDto dto = service.getDataById(u_id);
		
		model.addObject("dto", dto);
		model.setViewName("/2/login/updateform");
		
		return model;
	}
	
	//회원정보수정
	@PostMapping("/update")
	public String update(LoginDto login, HttpSession session) {
		
		//System.out.println(login);
		service.updateuserinfo(login);
		
		session.setAttribute("myname", login.getU_name());
		
		return "redirect:main";
	}
	

	
}

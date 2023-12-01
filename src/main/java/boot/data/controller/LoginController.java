package boot.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import boot.data.Dto.LoginDto;
import boot.data.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	
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
			int failcheck = service.failcheck(u_id);
			
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
			}
			else {
				//실패시  session failcount 1씩증가 ;
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
		@GetMapping("/pwsearch")
		public String pwsearch()
		{
			return "/2/login/findpwform";
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
}

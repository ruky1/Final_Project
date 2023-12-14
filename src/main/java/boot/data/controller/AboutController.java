package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.data.Dto.NoticeDto;
import boot.data.service.AdminService;

@Controller
public class AboutController {
	@Autowired
	AdminService service;
	
	@GetMapping("about")
	public String about(Model model) {
		List<NoticeDto>list=service.getAllNotice();
		model.addAttribute("list",list);
		return "/2/about/about";
	}
	
	
	
}

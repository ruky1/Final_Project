package boot.data.controller;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import boot.data.Dto.SangpumDto;
import boot.data.mapper.InterestMapperInter;

@Controller
public class InterestController {
	
	@Autowired
	InterestMapperInter inter;
	
	@GetMapping("/interest/insert")
	@ResponseBody
	public String insert(String i_id, int i_sangpum) {
		
		inter.insertInterest(i_id, i_sangpum);
		
		return "insert";
	}
	
	@GetMapping("/interest/delete")
	@ResponseBody
	public String delete(String i_id, int i_sangpum) {
		inter.deleteInterest(i_id, i_sangpum);
		return "delete";
	}
	
	@GetMapping("/interest/likesangpum")
	public ModelAndView likesangpum(String u_id) {
		ModelAndView model = new ModelAndView();
		
	 	List<SangpumDto> list = inter.selectlikesangpum(u_id);
	 	int likescnt = inter.countlikes(u_id);

	 	for(SangpumDto dto : list) {
	 		StringTokenizer st = new StringTokenizer(dto.getJ_imageurl(),",");
	 		String photo = st.nextToken();
	 		//System.out.println(photo);
	 		
	 		dto.setSangimg(photo);
	 	}
	 	model.addObject("likescnt", likescnt);
	 	model.addObject("list", list);
	 	model.setViewName("/2/mypage/likesangpum");
		
		return model;
	}
	
	@GetMapping("/interest/count")
	@ResponseBody
	public int count(String i_id, int i_sangpum) {
		return inter.getCount(i_id, i_sangpum);
	}
	
	

}

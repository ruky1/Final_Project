package boot.data.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.Dto.PurchaseDto;
import boot.data.Dto.SangpumDto;
import boot.data.mapper.PurchaseMapperInter;

@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseMapperInter inter;
	
	@PostMapping("/purchase/insert")
	@ResponseBody
	public String insert(String u_id, int j_sangid, String p_method) {
		inter.insertPurchase(u_id, j_sangid, p_method);
		//구매하면 판매완료 컬럼 1로 변경
		inter.updatesellcomplete(j_sangid);
		
		return "insert";
	}
	
	//구매내역 리스트
	@GetMapping("/sangpum/buysangpum")
	public ModelAndView buysangpum(String u_id) {
		ModelAndView model = new ModelAndView();
		
	 	List<SangpumDto> list = inter.selectbuysangpum(u_id);
	 	int count = inter.countpurchase(u_id);
	 	String[] buydate = inter.selectpurchase(u_id);

	 	for(SangpumDto dto : list) {
	 		
	 		for(int i=0; i<buydate.length; i++) {
		 		StringTokenizer st = new StringTokenizer(buydate[i]," ");
			 	buydate[i] = st.nextToken();
		 	}
	 		
	 		StringTokenizer st = new StringTokenizer(dto.getJ_imageurl(),",");
	 		String photo = st.nextToken();
	 		//System.out.println(photo);
	 		
	 		dto.setBuydate(buydate);
	 		dto.setSangimg(photo);
	 	}
	 	
	 	model.addObject("buydate", buydate);
	 	model.addObject("count", count);
	 	model.addObject("list", list);
	 	model.setViewName("/2/mypage/buysangpum");
		
		return model;
	}
		
		//판매중인 상품 리스트
		@GetMapping("/sangpum/sellsangpum")
		public ModelAndView sellsangpum(String u_id) {
			ModelAndView model = new ModelAndView();
			
		 	List<SangpumDto> list = inter.sellsangpumlist(u_id);
		 	
		 	for(SangpumDto dto : list) {
		 		
		 		StringTokenizer st = new StringTokenizer(dto.getJ_imageurl(),",");
		 		String photo = st.nextToken();
		 		//System.out.println(photo);
		 		
		 		dto.setSangimg(photo);
		 	}

		 	model.addObject("list", list);
		 	model.setViewName("/2/mypage/sellsangpum");
			
			return model;
		}
		
		//판매완료 상품 리스트
		@GetMapping("/sangpum/sellcomplete")
		public ModelAndView sellcomplete(String u_id) {
			ModelAndView model = new ModelAndView();
			
		 	List<SangpumDto> list = inter.sellcomplete(u_id);
		 	String[] selectselldate = inter.selectselldate(u_id);
		 	int countsell = inter.countsellcomplete(u_id);

		 	for(SangpumDto dto : list) {
		 		
		 		for(int i=0; i<selectselldate.length; i++) {
			 		StringTokenizer st = new StringTokenizer(selectselldate[i]," ");
			 		selectselldate[i] = st.nextToken();
			 	}
		 		
		 		StringTokenizer st = new StringTokenizer(dto.getJ_imageurl(),",");
		 		String photo = st.nextToken();
		 		//System.out.println(photo);
		 		
		 		dto.setBuydate(selectselldate);
		 		dto.setSangimg(photo);
		 	}
		 	
		 	model.addObject("countsell", countsell);
		 	model.addObject("selectselldate", selectselldate);
		 	model.addObject("list", list);
		 	model.setViewName("/2/mypage/sellcomplete");
			
			return model;
		}
		
}

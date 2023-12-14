package boot.data.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.Dto.AnswerDto;
import boot.data.mapper.AnswerMapperInter;

@RestController
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	AnswerMapperInter inter;

		
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute AnswerDto adto) { //forward 없이 함 (리턴값없음) 

		inter.insertAnswer(adto);
		
	}
	
	@GetMapping("/alist")
	public List<AnswerDto> select(String num) {
		List<AnswerDto> list = new ArrayList<>();
		
		list = inter.getAllAnswers(num);
		
		return list;
	}
	
	@GetMapping("/adelete")
	public void delete(String idx) {
		inter.deleteAnswer(idx);
	}
	
	//수정창 content 띄우기
	@GetMapping("/adata")
	public AnswerDto getData(String idx) {
		return inter.getAnswer(idx);
	}
	
	//수정
	@PostMapping("/aupdate")
	public void update(AnswerDto dto) {
		inter.updateAnswer(dto);
	}
	
	//댓글 갯수
	@GetMapping("/getAnswerCount")
	 @ResponseBody
	 public List<Integer> answerCount(String num) {
		
		List<Integer> countList = new ArrayList<>();
		
		countList = inter.getAnswerCount(num);
		
		 return countList;
	 }
}

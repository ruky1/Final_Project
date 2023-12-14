package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.taglibs.standard.lang.jstl.Literal;

import boot.data.Dto.AnswerDto;

@Mapper
public interface AnswerMapperInter {
	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAllAnswers(String num);
	public AnswerDto getAnswer(String idx);
	public void updateAnswer(AnswerDto dto);
	public void deleteAnswer(String idx);
	
	//댓글 갯수
	public List<Integer>  getAnswerCount(String num);
}

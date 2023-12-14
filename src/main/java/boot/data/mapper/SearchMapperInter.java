package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.SangpumDto;
import boot.data.Dto.SearchSaveDto;

@Mapper
public interface SearchMapperInter {

	//관련검색어 기능
	public List<String> sangSearch(String search);
	
	public List<SangpumDto> mainSangList(String search);
	
	//검색리스트
	public List<SangpumDto> sangList(String search, String option, String category);
	
	//검색한 상품 갯수
	public int getSangpumCount(String search, String category);
	//최근 검색 기능
	public List<SearchSaveDto> searchSave(String s_id);
	
	//인기 검색어 기능(10개)
	public List<String> bestsearch();
	
	//검색어 입력하면 해당 아이디에 따른 검색어 저장
	public void searchsaveinsert(String s_id, String s_searchword);
	
	//해당 아이디에서 해당 검색어 개수 출력
	public int countsearchword(String s_id, String s_searchword);
	
	//최근 검색어 삭제
	public void recentdelete(String s_num);
	
	//최근 검색어 모두삭제
	public void allrecentdelete(String s_id);

	
}

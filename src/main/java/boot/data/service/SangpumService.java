package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.Dto.SangpumDto;
import boot.data.mapper.SangpumMapperInter;


@Service
public class SangpumService implements SangpumServiceInter {
	
	@Autowired
	SangpumMapperInter mapperInter;

	@Override
	public SangpumDto getSangpumById(int sangIdx) {
		// TODO Auto-generated method stub
		return mapperInter.getSangpumById(sangIdx);
	}

	@Override
	public int getMaxNum() {
		// 글 작성후 해당 페이지로 이동을 위해 사용
		return mapperInter.getMaxNum();
	}

	@Override
	public int getMainCount() {
		// TODO Auto-generated method stub
		return mapperInter.getMainCount();
	}
	
	@Override
	public int getTotalCount(String option, String search) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		
		map.put("option", option);		// 검색 옵션 설정
		map.put("search", search);		// 검색 단어
		
		return mapperInter.getTotalCount(map);
	}

	@Override
	public List<SangpumDto> getPagingList(String option, String search, int startnum, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		map.put("option", option);		// 검색 옵션 설정
		map.put("search", search);		// 검색 단어
		map.put("startnum", startnum);	// 페이지 시작번호
		map.put("perpage", perpage);	// 페이지당 출력할 게시글 수
		
		return mapperInter.getPagingList(map);
	}

	@Override
	public void insertSangpum(SangpumDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertSangpum(dto);
	}

	@Override
	public void updateReadCount(int j_sangid) {
		// TODO Auto-generated method stub
		mapperInter.updateReadCount(j_sangid);
	}

	/*@Override
	public SangpumDto getData(int j_sangid) {
		// TODO Auto-generated method stub
		return mapperInter.getData(j_sangid);
	}*/

	@Override
	public void updateSangpum(SangpumDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateSangpum(dto);
	}

	@Override
	public void deleteSangpum(int j_sangid) {
		// TODO Auto-generated method stub
		mapperInter.deleteSangpum(j_sangid);
	}

	@Override
	public void updateInterest(int j_sangid) {
		// TODO Auto-generated method stub
		mapperInter.updateInterest(j_sangid);
	}

	
	//상품 판매 완료 건수
	@Override
	public int salesCount(String u_id) {
		// TODO Auto-generated method stub
		return mapperInter.salesCount(u_id);
	}
}

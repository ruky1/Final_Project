package boot.data.service;

import java.util.List;

import boot.data.Dto.SangpumDto;

public interface SangpumServiceInter {
	
	public SangpumDto getSangpumById(int sangIdx);

	public int getMaxNum();
	public int getMainCount();
	public int getTotalCount(String option, String search);
	public List<SangpumDto> getPagingList(String option, String search, int startnum, int perpage);
	public void insertSangpum(SangpumDto dto);
	public void updateReadCount(int j_sangid);
	//public SangpumDto getData(int j_sangid);
	public void updateSangpum(SangpumDto dto);
	public void deleteSangpum(int j_sangid);
	public void updateInterest(int num);
	
	
	
	//상품 판매 완료 건수
	public int salesCount(String u_id);
}

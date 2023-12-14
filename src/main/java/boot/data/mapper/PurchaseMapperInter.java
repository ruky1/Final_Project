package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.SangpumDto;

@Mapper
public interface PurchaseMapperInter {
	public void insertPurchase(String u_id, int j_sangid, String p_method);
	//구매한 상품 판매완료 컬럼 1로 변경
	public void updatesellcomplete(int j_sangid);
	
	//구매한 개수 출력
	public int countpurchase(String u_id);
	//구매한 상품 출력
	public List<SangpumDto> selectbuysangpum(String u_id);
	//구매한 날짜 출력
	public String[] selectpurchase(String u_id);
	
	//판매중인 상품 개수
	public int countIdOfsell(String u_id);
	//판매중인 상품 출력
	public List<SangpumDto> sellsangpumlist(String u_id);
	
	//판매완료 상품 개수
	public int countsellcomplete(String u_id);
	//판매안료 상품 출력
	public List<SangpumDto> sellcomplete(String u_id);
	//판매 날짜 출력
	public String[] selectselldate(String u_id);
}

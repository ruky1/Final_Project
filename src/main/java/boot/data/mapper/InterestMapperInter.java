package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.SangpumDto;

@Mapper
public interface InterestMapperInter {
	public void insertInterest(String i_id, int i_sangpum);
	public void deleteInterest(String i_id, int i_sangpum);
	public int getCount(String i_id, int i_sangpum);

	public int countlikes(String i_id);
	public List<SangpumDto> selectlikesangpum(String u_id);
}

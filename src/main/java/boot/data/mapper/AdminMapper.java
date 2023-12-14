package boot.data.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.AdminLoginDto;
import boot.data.Dto.LoginDto;
import boot.data.Dto.NoticeDto;
import boot.data.Dto.SangpumDto;
import boot.data.Dto.UserDto;

@Mapper
public interface AdminMapper {
	
	public AdminLoginDto getAdminID(String a_id);
	public int adminLoginPassCheck(Map<String, String>map);
	public void insertNotice(NoticeDto n_dto);
	public List<NoticeDto> getAllNotice();
	public List<NoticeDto> getAllNoticeList(HashMap<String, Integer>map);
	public NoticeDto getNoticeNum(int n_num);
	public void deleteNotice(int n_num);
	public void updateNotice(NoticeDto dto);
	public void failreset(String u_id); //페일카운트0
	public List<LoginDto> failuser(); //페일카운트 10이상 유저리스트
	public List<UserDto> userList();
	public int getTotalNoticeCount();
	public List<SangpumDto> adminSaleComplete();
	public List<SangpumDto> adminSale();
	public int adminTodayLogin();
	public int adminYesterdayLogin();
	public int adminWeekLogin();
	public void deleteUser(String u_id);
}

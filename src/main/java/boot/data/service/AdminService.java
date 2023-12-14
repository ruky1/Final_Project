package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.Dto.AdminLoginDto;
import boot.data.Dto.LoginDto;
import boot.data.Dto.NoticeDto;
import boot.data.Dto.SangpumDto;
import boot.data.Dto.UserDto;
import boot.data.mapper.AdminMapper;

@Service
public class AdminService implements AdminServiceInter {
	@Autowired
	AdminMapper mapperInter;

	@Override
	public AdminLoginDto getAdminID(String a_id) {
		// TODO Auto-generated method stub
		return mapperInter.getAdminID(a_id);
	}

	@Override
	public int adminLoginPassCheck(String a_id, String a_pass) {
		// TODO Auto-generated method stub
		Map<String, String>map=new HashMap<>();
		map.put("a_id", a_id);
		map.put("a_pass", a_pass);
		return mapperInter.adminLoginPassCheck(map);
	}

	@Override
	public void insertNotice(NoticeDto n_dto) {
		// TODO Auto-generated method stub
		mapperInter.insertNotice(n_dto);
	}

	@Override
	public List<NoticeDto> getAllNoticeList(int start,int perPage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer>map=new HashMap<>();
		map.put("start", start);
		map.put("perPage", perPage);
		return mapperInter.getAllNoticeList(map);
	}

	@Override
	public NoticeDto getNoticeNum(int n_num) {
		// TODO Auto-generated method stub
		return mapperInter.getNoticeNum(n_num);
	}

	@Override
	public void deleteNotice(int n_num) {
		// TODO Auto-generated method stub
		mapperInter.deleteNotice(n_num);
	}

	@Override
	public void updateNotice(NoticeDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateNotice(dto);
	}

	@Override
	public void failreset(String u_id) {
		// TODO Auto-generated method stub
		mapperInter.failreset(u_id);
	}

	@Override
	public List<LoginDto> failuser() {
		// TODO Auto-generated method stub
		return mapperInter.failuser();
	}

	@Override
	public List<UserDto> userList() {
		// TODO Auto-generated method stub
		return mapperInter.userList();
	}

	@Override
	public int getTotalNoticeCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalNoticeCount();
	}

	@Override
	public List<NoticeDto> getAllNotice() {
		// TODO Auto-generated method stub
		return mapperInter.getAllNotice();
	}

	@Override
	public List<SangpumDto> adminSaleComplete() {
		// TODO Auto-generated method stub
		return mapperInter.adminSaleComplete();
	}

	@Override
	public List<SangpumDto> adminSale() {
		// TODO Auto-generated method stub
		return mapperInter.adminSale();
	}

	@Override
	public int adminTodayLogin() {
		// TODO Auto-generated method stub
		return mapperInter.adminTodayLogin();
	}

	@Override
	public int adminYesterdayLogin() {
		// TODO Auto-generated method stub
		return mapperInter.adminYesterdayLogin();
	}

	@Override
	public int adminWeekLogin() {
		// TODO Auto-generated method stub
		return mapperInter.adminWeekLogin();
	}

	@Override
	public void deleteUser(String u_id) {
		// TODO Auto-generated method stub
		mapperInter.deleteUser(u_id);
	}
	
	
	

	
	
	
}

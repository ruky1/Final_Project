package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.Dto.LoginDto;

public interface LoginServiceInter {
	public void insertMember(LoginDto login);
	public List<LoginDto>getAllMembers();
	public boolean getSerchId(String u_id); //아이디 존재 여부
	public String getName(String u_id);
	public int loginPassCheck(String u_id, String u_pass);
	public LoginDto getDataById(String u_id);
	public void updateuserinfo(LoginDto login);
	
	public int findIdCheck(String u_name, String u_email, String u_hp);
	public String getId(String u_name, String u_email, String u_hp);
	public void failcount(String u_id);
	public void failreset(String u_id);
	public int failcheck(String u_id);
	
	public int findpwstart(String u_id, String u_hp); //아이디전화번호 체크
	public void pwchange(String u_id, String u_pass); //비밀번호 변경
	public int randomnum(); //난수생성
}

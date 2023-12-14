package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.LoginDto;

@Mapper
public interface LoginMapperInter {
	
	public void insertMember(LoginDto login);

	public List<LoginDto> getAllMembers();

	public int getSerchId(String u_id); 

	public String getName(String u_id);

	public int loginPassCheck(Map<String, String> map);

	public LoginDto getDataById(String u_id);
	
	public void updateuserinfo(LoginDto login);
	
	public int findIdCheck(Map<String,String>map);
	
	public String getId(String u_name, String u_email, String u_hp);
	
	public void failcount(String u_id);
	
	public void failreset(String u_id);
	
	public int failcheck(String u_id);
	
	public int findpwstart(Map<String,String>map); //아이디전화번호 체크
	 
	public void pwchange(String u_id, String u_pass); //비밀번호 변경
	
}

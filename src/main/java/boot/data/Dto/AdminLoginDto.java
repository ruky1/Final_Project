package boot.data.Dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("admin")
public class AdminLoginDto {
	private String a_id;
	private String a_pass;
	private String a_email;
	private int a_right;
	private String a_hp;
	private int a_num;
	private String a_name;
}

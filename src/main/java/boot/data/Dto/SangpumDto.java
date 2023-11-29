package boot.data.Dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sangpum")
public class SangpumDto {
	
	private int j_sangid;
	private String j_title;
	private int j_price;
	private String member_id;
	private String member_name;
	private String member_hp;
	private String j_explanation;
	private String j_category;
	private Timestamp j_postdate;
	private String j_addr;
	private String j_imageurl;
	private int j_readcount;
	private int j_interest;
}
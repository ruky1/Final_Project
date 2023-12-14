package boot.data.Dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("noticeDto")
public class NoticeDto {
	private String n_content;
	private int n_hits;
	private String n_id;
	private String n_name;
	private int n_num;
	private String n_title;
	private Timestamp n_registration_date;
	
}

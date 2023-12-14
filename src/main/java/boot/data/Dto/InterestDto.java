package boot.data.Dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("interest")
public class InterestDto {
	private int i_num;
	private String i_id;
	private int i_sangpum;
}

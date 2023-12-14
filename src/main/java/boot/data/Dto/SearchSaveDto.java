package boot.data.Dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("searchdto")
public class SearchSaveDto {
	
	private int s_num;
	private String s_id;
	private String s_searchword;
}

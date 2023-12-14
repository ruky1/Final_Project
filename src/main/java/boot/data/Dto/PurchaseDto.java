package boot.data.Dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("purchase")
public class PurchaseDto {
	private int p_id;
	private String u_id;
	private int j_sangid;
	private String p_method;
	private Timestamp p_date;
}

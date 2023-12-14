package boot.data.Dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MessagealarmDto")
public class MessagealarmDto {

	private String messal_num;
	private String receiver_id;
	private String sender_id;
	private int room_num;
	private int chkcount;
}

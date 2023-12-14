package boot.data.Dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("message")
public class MessageDto {

	private int mess_num;
	private int room_num;
	private String sender_id;
	private String receiver_id;
	private String mess_content;
	private Timestamp mess_writeday;
	private int mess_readCnt;//메시지 알림기능, 초기값은 1로하고 
	
	private String mess_time;
	private String mess_img;
}

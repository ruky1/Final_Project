package boot.data.Dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("room")
public class MessageRoomDto {
	
	private int room_num;
	private int j_sangid;
	private String sender_id;
	private String receiver_id;
	private Timestamp room_createday;

	private String recent_mess;
	private String Sang_img;
	private int mess_alarmCnt;
}

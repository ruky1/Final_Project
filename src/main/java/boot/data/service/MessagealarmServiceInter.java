package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.Dto.MessageDto;
import boot.data.Dto.MessagealarmDto;


public interface MessagealarmServiceInter {

	public int getMessAlarmCount(int room_num);
	public MessagealarmDto getMessAlarm(int room_num);
	public void updateMessAlarmChkcount(int room_num);
	public void delteMessAlarm(int room_num);
	public void insertMessAlarm(String receiver_id,String sender_id,int room_num,int chkcount);
	public int getTotalCountMessAlarm(String user_id);
	/* public List<MessageDto> getAllMessAlarm(String user_id); */
}

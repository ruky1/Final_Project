package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.MessagealarmDto;

@Mapper
public interface MessagealarmMapperInter {

	public int getMessAlarmCount(int room_num);
	public MessagealarmDto getMessAlarm(int room_num);
	public void updateMessAlarmChkcount(int room_num);
	public void delteMessAlarm(int room_num);
	public void insertMessAlarm(Map<String, Object> map);
	public int getTotalCountMessAlarm(String user_id);
	public List<MessagealarmDto> getAllMessAlarm(String user_id);
}

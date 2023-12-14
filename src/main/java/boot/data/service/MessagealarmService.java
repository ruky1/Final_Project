package boot.data.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.Dto.MessageDto;
import boot.data.Dto.MessagealarmDto;
import boot.data.mapper.MessagealarmMapperInter;


@Service
public class MessagealarmService implements MessagealarmServiceInter {

	@Autowired
	MessagealarmMapperInter mapperInter;
	
	@Autowired
	MessageService mservice;
	
	@Autowired
	UserService uservice;

	@Override
	public int getMessAlarmCount(int room_num) {
		// TODO Auto-generated method stub
		return mapperInter.getMessAlarmCount(room_num);
	}

	@Override
	public MessagealarmDto getMessAlarm(int room_num) {
		// TODO Auto-generated method stub
		return mapperInter.getMessAlarm(room_num);
	}

	@Override
	public void updateMessAlarmChkcount(int room_num) {
		// TODO Auto-generated method stub
		mapperInter.updateMessAlarmChkcount(room_num);
	}

	@Override
	public void delteMessAlarm(int room_num) {
		// TODO Auto-generated method stub
		mapperInter.delteMessAlarm(room_num);
	}

	@Override
	public void insertMessAlarm(String receiver_id,String sender_id, int room_num, int chkcount) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		
		map.put("receiver_id", receiver_id);
		map.put("sender_id", sender_id);
		map.put("room_num", room_num);
		map.put("chkcount", chkcount);
		
		mapperInter.insertMessAlarm(map);
	}

	@Override
	public int getTotalCountMessAlarm(String user_id) {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCountMessAlarm(user_id);
	}

	
}

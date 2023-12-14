package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.Dto.MessageRoomDto;
import boot.data.mapper.MessageRoomMapperInter;

@Service
public class MessageRoomService implements MessageRoomServiceInter {
	
	@Autowired
	MessageRoomMapperInter mapper;
	
	@Override
	public int getMaxRoom() {
		// TODO Auto-generated method stub
		return mapper.getMaxRoom();
	}

	@Override
	public void insertRoom(MessageRoomDto dto) {
		// TODO Auto-generated method stub
		mapper.insertRoom(dto);
	}

	@Override
	public List<MessageRoomDto> getRoomsByUser(String user_id) {
		// TODO Auto-generated method stub
		return mapper.getRoomsByUser(user_id);
	}

	@Override
	public String getRoomBySangIdxAndUserId(int j_sangid, String sender_id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("j_sangid", j_sangid);
		map.put("sender_id", sender_id);
		return mapper.getRoomBySangIdxAndUserId(map);
	}

	@Override
	public MessageRoomDto getRoomById(int room_num) {
		// TODO Auto-generated method stub
		return mapper.getRoomById(room_num);
	}

	@Override
	public List<MessageRoomDto> getRoomsBySangpum(int j_sangid) {
		// TODO Auto-generated method stub
		return mapper.getRoomsBySangpum(j_sangid);
	}

	@Override
	public List<MessageRoomDto> selectAllRooms(String user_id, String sangidx) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("sangidx", sangidx);
		return mapper.selectAllRooms(map);
	}

	@Override
	public int getCountAllRoomsBySangpum(int sangidx) {
		// TODO Auto-generated method stub
		return mapper.getCountAllRoomsBySangpum(sangidx);
	}

	

}

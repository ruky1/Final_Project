package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.MessageRoomDto;

@Mapper
public interface MessageRoomMapperInter {
	
	public int getMaxRoom();
	public String getRoomBySangIdxAndUserId(Map<String, Object> map);
	//로그인한 사용자가 선택한 상품의 판매자와 채팅한 방이 있는지 확인,int j_sangid, String user_id
	public void insertRoom(MessageRoomDto dto);
	//user_num은 현재 로그인한 사용자(sender)이고 receiver_num은 상품의 판매자가 됨
	public List<MessageRoomDto> getRoomsByUser(String user_id);
	//로그인한 사용자가 대화중인 모든 방의 리스트
	public MessageRoomDto getRoomById(int room_num);
	
	public List<MessageRoomDto> getRoomsBySangpum(int j_sangid);
	
	public List<MessageRoomDto> selectAllRooms(Map<String, String> map);
	
	public int getCountAllRoomsBySangpum(int sangidx);
}

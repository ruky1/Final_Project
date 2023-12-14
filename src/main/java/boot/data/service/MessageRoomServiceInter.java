package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.Dto.MessageRoomDto;

public interface MessageRoomServiceInter {
	
	public int getMaxRoom();
	public String getRoomBySangIdxAndUserId(int j_sangid, String sender_id);
	//로그인한 사용자가 선택한 상품의 판매자와 채팅한 방이 있는지 확인,int j_sangid, int user_num
	public void insertRoom(MessageRoomDto dto);//user_num은 현재 로그인한 사용자(sender)이고 receiver_num은 상품의 판매자가 됨
	public List<MessageRoomDto> getRoomsByUser(String user_id);//로그인한 사용자가 대화중인 모든 방의 리스트
	public MessageRoomDto getRoomById(int room_num);
	public List<MessageRoomDto> getRoomsBySangpum(int j_sangid);
	//채팅방 가져오기
	public List<MessageRoomDto> selectAllRooms(String user_id, String sangidx);
	public int getCountAllRoomsBySangpum(int sangidx);//상품별 채팅방의 개수 출력
}

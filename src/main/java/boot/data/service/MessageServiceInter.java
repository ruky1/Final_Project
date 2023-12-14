package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.Dto.MessageDto;

public interface MessageServiceInter {
	
	public List<MessageDto> selectAllChatByRoom(int room_num);
	public void insertMessage(MessageDto dto);
	public void deleteMessage(String mess_num);
	public int selectMaxNum();
	//public int getCountOfMessage(String user_num,String other);
	public void deleteMessageByRoom(int room_num);
	public int getRecentMessageByRoom(int room_num);
	public MessageDto getMessageByNum(int mess_num);
	public void messageReadByNum(int mess_num);//메시지 receiver가 채팅창에 들어오면 읽음표시로 변경(0)
	public int unReadMessByRoom(String user_id, int room_num);//방별 읽지않은 메시지 개수 출력
	public int totalUnreadMessByUserID(String user_id);//회원 로그인시 모든 읽지않은 메세지 개수 출력
}

package boot.data.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.OnMessage;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import boot.data.Dto.MessageDto;
import boot.data.service.MessageRoomService;
import boot.data.service.MessageService;


//상속받은 TextWebSocketHandler는 handleTextMessage를 실행
@Component
public class SocketHandler extends TextWebSocketHandler {
	
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵

	
	@Autowired
	MessageService mservice;
	
	@Autowired
	MessageRoomService roomservice;
	
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		
	
	//웹소켓 연결이 되면 동작하는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //소켓 연결시
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(), session);
        //웹 소켓이 생성될 때마다 리스트에 넣어줌
      	sessions.add(session);
    }
    
    //웹소켓 연결이 종료되면 동작하는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //소켓 종료시
        sessionMap.remove(session.getId());
        super.afterConnectionClosed(session, status);
    }
    
  //메시지를 발송하면 동작하는 메소드
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message){

        //메시지 발송시
        String msg = message.getPayload();
        
        JSONObject ob=new JSONObject(msg);
        
        
      //메시지 구분(보낸사람:내용), default로 채팅방에 receiver는 판매자가 되고, sender는 구매자가 됨
        String mynum=ob.getString("mynum"); //보낸사람
        int room_num=ob.getInt("room_num"); //그룹
        String receiver= roomservice.getRoomById(room_num).getReceiver_id();//받는사람num
        //String receiver = ob.getString("receiver");
        String content=ob.getString("msg"); //내용
        String type=ob.getString("type");
        
        if(mynum.equals(receiver)) {//판매자가 채팅창에 들어올 때, 즉 구매자가 판매자의 메시지를 받는 사람이 됨
        	receiver=roomservice.getRoomById(room_num).getSender_id();
        }
        
        //메시지 저장
        MessageDto dto=new MessageDto();
		  
        String user_id=mynum;
        dto.setSender_id(user_id);
        
        dto.setReceiver_id(receiver);
        
        dto.setRoom_num(room_num);
        
        //사진을 보냈다면
        if(type.equals("img")) {
        	content="<img src='/messagephoto/"+content+"'>";
        }
        
        dto.setMess_content(content);
		  
        mservice.insertMessage(dto);
        
        //System.out.println((String) session.getAttributes().get("myid"));
        
        /*for(WebSocketSession single : sessions){
        	
        	String hsid = (String) single.getAttributes().get("myid");
        	
        	if(single.getAttributes().get("myid").equals(session.getAttributes().get("myid"))) {
        		
        	}
        }*/
        
        
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            //System.out.println(sessionMap.get(session.getId()));
            try {
                wss.sendMessage(new TextMessage(msg));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
		
        
    }

}
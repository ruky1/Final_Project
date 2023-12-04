package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import boot.data.service.MessageService;
import boot.data.service.MessagealarmService;

@Controller
public class MessagealarmController {
	
	@Autowired
	MessagealarmService maservice;
	
	
	//알림전송
	@GetMapping("/messagealaramadd")
	public void messagealaramAdd(HttpSession session, String other,int room_num ) {
		
		//현재 사용자의 user_id
		String user_id= (String)session.getAttribute("myid");
		
		//상대와의 메시지 알림이 있는지 확인
		int msgAlarmCount = maservice.getMessAlarmCount(room_num);
		
		//알림이 존재하면 알림 +1
				if(msgAlarmCount!=0) {
					maservice.updateMessAlarmChkcount(room_num);
				}else {
					//알림이 존재하지 않으면 insert
					maservice.insertMessAlarm(other, user_id, room_num, 1); //처음이니까 chkcount는 1
				}
		
	}

}

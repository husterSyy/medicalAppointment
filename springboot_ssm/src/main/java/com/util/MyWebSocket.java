package com.util;

import java.io.IOException;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.domain.Chatlog;
import com.service.impl.ConsultImpl;





@Component
@ServerEndpoint(value="/WebSocket/{user}",encoders={WebSocketEncoder.class},decoders={WebSocketDecoder.class})
public class MyWebSocket {
	//�Ự
	private Session session;
	//�û����
	private String user;
	//���յ���Ϣʱ��
	private Date myTime;

	//service
	private ConsultImpl consultImpl;
	//���캯������service
	public MyWebSocket(){
		consultImpl=ApplicationContextProvider.getBean(ConsultImpl.class);
	}
	
	//��ÿ���ͻ��˵�����socket
	private static Map<String,MyWebSocket> webSocketMap = new Hashtable<String,MyWebSocket>();
	
	//ͬʱ������
	private static int onlineCount = 0;
	
	public Map<String, MyWebSocket> getWebSocketMap() {
		return webSocketMap;
	}
	
	//������ʱ������Ԫ�����map
	@OnOpen
	public void onOpen(Session session,@PathParam("user") String user) throws IOException, EncodeException{
		this.session=session;
		onlineCount+=1;
		System.out.println(onlineCount);
		
		//��ȡ�û�id������<key,websocket>����map
		this.user=user;
		webSocketMap.put(user, this);
		
		System.out.println("���ӽ�����");
		System.out.println(user);
		
		//�����δ����Ϣ�����͵��ͻ���
		List<Chatlog> chatlogs=consultImpl.getSavedChatlog(user);
		for(Chatlog chatlog:chatlogs){
			System.out.println("���ͳɹ�");
			this.session.getBasicRemote().sendObject(chatlog);
		}
		//��ȡ���ɾ��
		consultImpl.deleteByReceiver(user);
	}
	
	//���յ���Ϣʱ
	@OnMessage
	public void onMessage(Chatlog chatlog,Session session) throws IOException, EncodeException{

		//���ý���ʱ��
		myTime=new Date();
		chatlog.setTime(myTime);
		if(chatlog!=null){
			if(webSocketMap.get(chatlog.getReceiver())!=null){
				//�����������ߣ�������߷�����Ϣ
				webSocketMap.get(chatlog.getReceiver()).session.getBasicRemote().sendObject(chatlog);
			}else{
				System.out.println("�û�������!");
				//������ߣ�������ݿ�
				consultImpl.saveChatlog(chatlog);
			}
		}
	}
	
	
	//�ر�����ʱ
	@OnClose
	public void onClose(){
		System.out.println("���ӹرգ�");
		//��map��ɾ��
		onlineCount--;
		webSocketMap.remove(user);
	}
	
	
	//�������ʱ
	@OnError
	public void onError(Throwable error){
		System.out.println(error.toString());
	}
	
	
}

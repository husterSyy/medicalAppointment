package com.util;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;




import com.domain.Chatlog;

import net.sf.json.JSONObject;
//�Զ��������
public class WebSocketDecoder implements Decoder.Text<Chatlog>{

	@Override
	public void init(EndpointConfig endpointConfig) {
	}

	@Override
	public void destroy() {
	}

	//���롪��json�ַ�תjava
	@Override
	public Chatlog decode(String s) throws DecodeException {
		JSONObject obj = JSONObject.fromObject(s);
		Chatlog chatlog = (Chatlog)JSONObject.toBean(obj,Chatlog.class);
		return chatlog;
	}
	
	@Override
	public boolean willDecode(String s) {
		return true;
	}


}

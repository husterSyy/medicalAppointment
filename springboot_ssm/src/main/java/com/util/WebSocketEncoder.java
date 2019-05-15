package com.util;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;



import com.domain.Chatlog;

import net.sf.json.JSONObject;
//�Զ��������
public class WebSocketEncoder implements Encoder.Text<Chatlog>{

	@Override
	public void init(EndpointConfig endpointConfig) {
	}

	@Override
	public void destroy() {
	}

	//���롪��javaתjson�ַ�
	@Override
	public String encode(Chatlog chatlog) throws EncodeException {
		JSONObject jsonObject = JSONObject.fromObject(chatlog);
	    return jsonObject.toString();
	}

}

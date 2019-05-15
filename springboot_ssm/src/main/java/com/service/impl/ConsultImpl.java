package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ChatlogMapper;
import com.domain.Chatlog;
import com.domain.ChatlogExample;
import com.domain.ChatlogExample.Criteria;
import com.service.IConsult;


@Service
public class ConsultImpl implements IConsult{
	@Autowired
	private ChatlogMapper chatlogMapper;
	
	//�������߶Ի���¼
	@Override
	public void saveChatlog(Chatlog chatlog) {
		chatlogMapper.insert(chatlog);
	}

	//��ݽ�����id�õ�������Ϣ
	@Override
	public List<Chatlog> getSavedChatlog(String receiver) {
		ChatlogExample chatlogExample = new ChatlogExample();
		Criteria c=chatlogExample.createCriteria();
		c.andReceiverEqualTo(receiver);
		return chatlogMapper.selectByExample(chatlogExample);
	}

	//�ɹ���������ݷ��ͺ�ɾ��
	@Override
	public void deleteByReceiver(String receiver) {
		ChatlogExample chatlogExample = new ChatlogExample();
		Criteria c=chatlogExample.createCriteria();
		c.andReceiverEqualTo(receiver);
		chatlogMapper.deleteByExample(chatlogExample);
	}

	
	

}

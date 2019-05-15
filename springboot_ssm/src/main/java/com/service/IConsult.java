package com.service;
 
import java.util.List;

import com.domain.Chatlog;



public interface IConsult {
	void saveChatlog(Chatlog chatlog);
	List<Chatlog> getSavedChatlog(String receiver);
	void deleteByReceiver(String receiver);
}

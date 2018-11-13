package com.xc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Message;
import com.xc.dao.MessageMapper;

@Service
public class MessageService {
       
    @Autowired
    MessageMapper messageMapper;

    /**
     * ����֪ͨ
     * @param message
     */
    public void saveMessage(Message message) {
        messageMapper.insertSelective(message);
    }
    
    /**
     * ��ȡ���е�֪ͨ
     * @return
     */
    public List<Message> getMessages() {
        List<Message> messages =  messageMapper.selectByExample(null);
        return messages;
    }
}

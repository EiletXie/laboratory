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
     * 保存通知
     * @param message
     */
    public void saveMessage(Message message) {
        messageMapper.insertSelective(message);
    }
    
    /**
     * 获取所有的通知
     * @return
     */
    public List<Message> getMessages() {
        List<Message> messages =  messageMapper.selectByExample(null);
        return messages;
    }
}

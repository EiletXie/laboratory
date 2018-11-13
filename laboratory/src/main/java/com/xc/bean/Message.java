package com.xc.bean;

import java.util.Date;

public class Message {
    private Integer messageId;

    private String title;

    private String content;

    private Date sendtime;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Message(Integer messageId, String title, String content, Date sendtime) {
        super();
        this.messageId = messageId;
        this.title = title;
        this.content = content;
        this.sendtime = sendtime;
    }

    public Message() {
        super();
    }

    @Override
    public String toString() {
        return "Message [messageId=" + messageId + ", title=" + title + ", content=" + content + ", sendtime="
                + sendtime + "]";
    }
    
    
}
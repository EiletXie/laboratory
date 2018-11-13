package com.xc.bean;

public class Logs {
    private Integer logId;

    private Integer rId;

    private String judge;

    
    public Logs() {
        super();
    }

    public Logs(Integer logId, Integer rId, String judge) {
        super();
        this.logId = logId;
        this.rId = rId;
        this.judge = judge;
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
        this.judge = judge == null ? null : judge.trim();
    }

    @Override
    public String toString() {
        return "Logs [logId=" + logId + ", rId=" + rId + ", judge=" + judge + "]";
    }
    
    
}
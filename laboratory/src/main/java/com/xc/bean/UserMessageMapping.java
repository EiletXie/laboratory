package com.xc.bean;

public class UserMessageMapping {
    private Integer id;

    private Integer mId;

    private Integer uId;

    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public UserMessageMapping(Integer id, Integer mId, Integer uId, String flag) {
        super();
        this.id = id;
        this.mId = mId;
        this.uId = uId;
        this.flag = flag;
    }

    public UserMessageMapping() {
        super();
    }

    @Override
    public String toString() {
        return "UserMessageMapping [id=" + id + ", mId=" + mId + ", uId=" + uId + ", flag=" + flag + "]";
    }
    
    
}
package com.xc.bean;

public class Laboratory {
    private Integer labId;

    private String labname;

    private Integer personnum;

    private String introduce;

    private Integer uId;
    
    //查询实验室的同时查询到对应负责的实验室老师
    private User user;

    
    public Laboratory() {
		super();
	}

	public Laboratory(Integer labId, String labname, Integer personnum, String introduce, Integer uId) {
		super();
		this.labId = labId;
		this.labname = labname;
		this.personnum = personnum;
		this.introduce = introduce;
		this.uId = uId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getLabId() {
        return labId;
    }

    public void setLabId(Integer labId) {
        this.labId = labId;
    }

    public String getLabname() {
        return labname;
    }

    public void setLabname(String labname) {
        this.labname = labname == null ? null : labname.trim();
    }

    public Integer getPersonnum() {
        return personnum;
    }

    public void setPersonnum(Integer personnum) {
        this.personnum = personnum;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

	@Override
	public String toString() {
		return "Laboratory [labId=" + labId + ", labname=" + labname + ", personnum=" + personnum + ", introduce="
				+ introduce + ", uId=" + uId + ", user=" + user + "]";
	}
    
    
}
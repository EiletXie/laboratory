package com.xc.bean;

import java.util.Date;

public class Apply {
    private Integer applyId;

    private String labname;

    private String one;

    private String three;

    private String five;

    private String seven;

    private String nine;

    private Date applydate;
    
    public Apply(Integer applyId, String labname, String one, String three, String five, String seven, String nine,
            Date applydate) {
        super();
        this.applyId = applyId;
        this.labname = labname;
        this.one = one;
        this.three = three;
        this.five = five;
        this.seven = seven;
        this.nine = nine;
        this.applydate = applydate;
    }

    public Apply() {
        super();
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public String getLabname() {
        return labname;
    }

    public void setLabname(String labname) {
        this.labname = labname == null ? null : labname.trim();
    }

    public String getOne() {
        return one;
    }

    public void setOne(String one) {
        this.one = one == null ? null : one.trim();
    }

    public String getThree() {
        return three;
    }

    public void setThree(String three) {
        this.three = three == null ? null : three.trim();
    }

    public String getFive() {
        return five;
    }

    public void setFive(String five) {
        this.five = five == null ? null : five.trim();
    }

    public String getSeven() {
        return seven;
    }

    public void setSeven(String seven) {
        this.seven = seven == null ? null : seven.trim();
    }

    public String getNine() {
        return nine;
    }

    public void setNine(String nine) {
        this.nine = nine == null ? null : nine.trim();
    }

    public Date getApplydate() {
        return applydate;
    }

    public void setApplydate(Date applydate) {
        this.applydate = applydate;
    }


    @Override
    public String toString() {
        return "Apply [applyId=" + applyId + ", labname=" + labname + ", one=" + one + ", three=" + three + ", five="
                + five + ", seven=" + seven + ", nine=" + nine + ", applydate=" + applydate + "]";
    }
    
}
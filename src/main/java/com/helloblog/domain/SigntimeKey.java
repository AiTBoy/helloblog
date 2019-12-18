package com.helloblog.domain;

import java.util.Date;

public class SigntimeKey {
    private Integer blogid;

    private Date lastsigntime;

    public Integer getBlogid() {
        return blogid;
    }

    public void setBlogid(Integer blogid) {
        this.blogid = blogid;
    }

    public Date getLastsigntime() {
        return lastsigntime;
    }

    public void setLastsigntime(Date lastsigntime) {
        this.lastsigntime = lastsigntime;
    }
}
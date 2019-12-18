package com.helloblog.domain;

import java.util.Date;

public class Reply{
    private Integer replyblogid;

    private Integer remarkid;

    private Date datetime;

    private String content;

    private Integer like;


    public Integer getReplyblogid() {
        return replyblogid;
    }

    public void setReplyblogid(Integer replyblogid) {
        this.replyblogid = replyblogid;
    }

    public Integer getRemarkid() {
        return remarkid;
    }

    public void setRemarkid(Integer remarkid) {
        this.remarkid = remarkid;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getLike() {
        return like;
    }

    public void setLike(Integer like) {
        this.like = like;
    }
}
package com.helloblog.domain;

import java.util.Date;

public class Remark {
    private Integer remarkid;

    private Integer artid;

    private Integer remarkblogid;

    private String content;

    private Integer praise;

    private Date datetime;

    public Integer getRemarkid() {
        return remarkid;
    }

    public void setRemarkid(Integer remarkid) {
        this.remarkid = remarkid;
    }

    public Integer getArtid() {
        return artid;
    }

    public void setArtid(Integer artid) {
        this.artid = artid;
    }

    public Integer getRemarkblogid() {
        return remarkblogid;
    }

    public void setRemarkblogid(Integer remarkblogid) {
        this.remarkblogid = remarkblogid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}
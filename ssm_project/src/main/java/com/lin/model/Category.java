package com.lin.model;

import java.util.Date;

public class Category {
    private int cId;

    private int cateId;

    private String cateName;

    private Byte blogCount;

    private Date createYear;

    private Date createDate;

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName == null ? null : cateName.trim();
    }

    public Byte getBlogCount() {
        return blogCount;
    }

    public void setBlogCount(Byte blogCount) {
        this.blogCount = blogCount;
    }

    public Date getCreateYear() {
        return createYear;
    }

    public void setCreateYear(Date createYear) {
        this.createYear = createYear;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
package com.lin.model;

import java.util.Date;

public class Blog {
    private int bId;

    private String introduction;
    
    private String bTitle;

    private int cateId;

    private int readTimes;

    private int commontTimes;

    private Boolean commontAuth;

    private Date createYear;

    private Date createDate;

    private String content;

    private Boolean homeBlog;
    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    
    public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle == null ? null : bTitle.trim();
	}

	public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public int getReadTimes() {
        return readTimes;
    }

    public void setReadTimes(int readTimes) {
        this.readTimes = readTimes;
    }

    public int getCommontTimes() {
        return commontTimes;
    }

    public void setCommontTimes(int commontTimes) {
        this.commontTimes = commontTimes;
    }

    public Boolean getCommontAuth() {
        return commontAuth;
    }

    public void setCommontAuth(Boolean commontAuth) {
        this.commontAuth = commontAuth;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	public Boolean getHomeBlog() {
		return homeBlog;
	}

	public void setHomeBlog(Boolean homeBlog) {
		this.homeBlog = homeBlog;
	}

	@Override
	public String toString() {
		return "Blog [bId=" + bId + ", introduction=" + introduction + ", bTitle=" + bTitle + ", cateId=" + cateId
				+ ", readTimes=" + readTimes + ", commontTimes=" + commontTimes + ", commontAuth=" + commontAuth
				+ ", createYear=" + createYear + ", createDate=" + createDate + ", content=" + content + ", homeBlog="
				+ homeBlog + "]";
	}

	
    
}
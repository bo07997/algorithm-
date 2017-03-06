package com.lin.model;

import java.util.Date;

public class Blog {
	
    private int bId;

    private int uId;
    
    private String introduction;
    
    private String bTitle;

    private int cateId;

    private int readTimes;

    private int commontTimes;

    private Boolean commontAuth;

    private String  dayChinese;

    private Date createDate;

    private String content;

    private Boolean homeBlog;
    
    private int up;
    
    private int down;
    
    private String cateCsdn;
    
    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    
    public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
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



    public String getDayChinese() {
		return dayChinese;
	}

	public void setDayChinese(String dayChinese) {
		this.dayChinese = dayChinese;
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

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public int getDown() {
		return down;
	}

	public void setDown(int down) {
		this.down = down;
	}

	public String getCateCsdn() {
		return cateCsdn;
	}

	public void setCateCsdn(String cateCsdn) {
		this.cateCsdn = cateCsdn;
	}

	@Override
	public String toString() {
		return "Blog [bId=" + bId + ", uId=" + uId + ", introduction=" + introduction + ", bTitle=" + bTitle
				+ ", cateId=" + cateId + ", readTimes=" + readTimes + ", commontTimes=" + commontTimes
				+ ", commontAuth=" + commontAuth + ", dayChinese=" + dayChinese + ", createDate=" + createDate
				+ ", content=" + content + ", homeBlog=" + homeBlog + ", up=" + up + ", down=" + down + ", cateCsdn="
				+ cateCsdn + "]";
	}





    
}
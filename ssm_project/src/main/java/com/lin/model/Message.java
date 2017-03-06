package com.lin.model;

import java.util.Date;

public class Message {
	//id
    private int messageId;
  //真实姓名
    private String realname;
   //介绍
    private String introduction;
   //专业
    private String profession;
   //工作
    private String job;
   //生日
    private Date birthday;
    
   //注册日期
    private Date comeday;

    private String qq;
    //电话
    private String phone;
   //头像地址
    private String head;
    //总阅读次数
    private int allTimes;
    //排名
    private int rank;
    //等级
    private int level;
    //行业
    private String hangye;
    //性别
    private int sex;
    
    //国籍地区
    private String nationality;

    //教育经历
    private String education;
    //工作经历
    private String jobexperience;
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession == null ? null : profession.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getComeday() {
        return comeday;
    }

    public void setComeday(Date comeday) {
        this.comeday = comeday;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head == null ? null : head.trim();
    }

	public int getAllTimes() {
		return allTimes;
	}

	public void setAllTimes(int allTimes) {
		this.allTimes = allTimes;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getHangye() {
		return hangye;
	}

	public void setHangye(String hangye) {
		 this.hangye = hangye == null ? null : hangye.trim();
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
		
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		 this.nationality = nationality == null ? null : nationality.trim();
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education == null ? null : education.trim();
	}

	public String getJobexperience() {
		return jobexperience;
	}

	public void setJobexperience(String jobexperience) {
		this.jobexperience = jobexperience == null ? null : jobexperience.trim();
	}

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", realname=" + realname + ", introduction=" + introduction
				+ ", profession=" + profession + ", job=" + job + ", birthday=" + birthday + ", comeday=" + comeday
				+ ", qq=" + qq + ", phone=" + phone + ", head=" + head + ", allTimes=" + allTimes + ", rank=" + rank
				+ ", level=" + level + ", hangye=" + hangye + ", sex=" + sex + ", nationality=" + nationality
				+ ", education=" + education + ", jobexperience=" + jobexperience + "]";
	}




    
}
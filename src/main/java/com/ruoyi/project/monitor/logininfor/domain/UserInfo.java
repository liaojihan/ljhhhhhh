package com.ruoyi.project.monitor.logininfor.domain;

import java.util.Date;

/**
 * 用户流量记录
 */
public class UserInfo {

    /**
     * 请求次数
     */
    private int requestCount;
    /**
     * 请求时间
     */
    private Date date;

    public int getRequestCount() {
        return requestCount;
    }

    public void setRequestCount(int requestCount) {
        this.requestCount = requestCount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    @Override
    public String toString() {
        return "UserInfo{" +
                "requestCount=" + requestCount +
                ", date=" + date +
                '}';
    }
}

package com.ruoyi.project.monitor.logininfor.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.project.monitor.logininfor.domain.Logininfor;
import com.ruoyi.project.monitor.logininfor.domain.UserInfo;

/**
 * 系统访问日志情况信息 服务层
 * 
 * @author ljh
 */
public interface ILogininforService
{
    /**
     * 新增系统登录日志
     * 
     * @param logininfor 访问日志对象
     */
    public void insertLogininfor(Logininfor logininfor);

    /**
     * 查询系统登录日志集合
     * 
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    public List<Logininfor> selectLogininforList(Logininfor logininfor);

    /**
     * 批量删除系统登录日志
     * 
     * @param ids 需要删除的数据
     * @return
     */
    public int deleteLogininforByIds(String ids);
    
    /**
     * 清空系统登录日志
     */
    public void cleanLogininfor();

    /**
     * 用户流量
     */
    Map<String, Object> userInfo();
}

package com.ruoyi.project.monitor.logininfor.mapper;

import java.util.List;
import com.ruoyi.project.monitor.logininfor.domain.Logininfor;
import com.ruoyi.project.monitor.logininfor.domain.UserInfo;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

/**
 * 系统访问日志情况信息 数据层
 * 
 * @author ljh
 */
public interface LogininforMapper
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
     * @return 结果
     */
    public int deleteLogininforByIds(String[] ids);

    /**
     * 清空系统登录日志
     * 
     * @return 结果
     */
    public int cleanLogininfor();

    /**
     * 获取用户流量
     * @return 用户流量
     */
    @Select("SELECT COUNT(t.days) AS requestCount, t.days AS date FROM ( " +
                "SELECT login_name, DATE_FORMAT(login_time, '%Y-%m-%d') AS days " +
                "FROM sys_logininfor l GROUP BY days, l.login_name " +
            ") t GROUP BY t.days")
    @Results({
        @Result(column = "date", property = "date"),
        @Result(column = "requestCount", property = "requestCount")
    })
    List<UserInfo> userInfo();
}

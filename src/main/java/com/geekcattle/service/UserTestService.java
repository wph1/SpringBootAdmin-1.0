package com.geekcattle.service;

import com.geekcattle.model.UserTest;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 用户测试类接口
 */
public interface UserTestService {
    /**
     * 用户测试类查询分页
     * @param userTest
     * @return
     */
    public List<UserTest> getPageList(UserTest userTest) ;

    /**
     * 总个数
     * @param example
     * @return
     */
    public Integer getCount(Example example);

    /**
     * 通过id进行查询某一条记录
     * @param id
     * @return
     */
    public UserTest getById(String id);

    /**
     * 通过名称进行查询
     * @param username
     * @return
     */
    public UserTest findByUsername(String username) ;

    /**
     * 通过id删除
     * @param id
     */
    public void deleteById(String id) ;

    /**
     * 插入数据
     * @param userTest
     */
    public void insert(UserTest userTest);

    /**
     * 保存或者更新
     * @param userTest
     */
    public void saveOrUpdate(UserTest userTest);

    /**
     * 通过example进行更新
     * @param userTest
     * @param example
     */
    public void updateExample(UserTest userTest, Example example);

}

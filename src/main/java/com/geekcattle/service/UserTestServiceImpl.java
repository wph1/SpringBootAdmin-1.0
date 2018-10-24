package com.geekcattle.service;

import com.geekcattle.mapper.UserTestMapper;
import com.geekcattle.mapper.virtualipconf.VirtualIpConfMapper;
import com.geekcattle.model.UserTest;
import com.geekcattle.model.virtualipconf.VirtualIpConf;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 用户测试实现类
 */
@Service
public class UserTestServiceImpl implements UserTestService {
    @Autowired
    private UserTestMapper userTestMapper;
    @Autowired
    private VirtualIpConfMapper virtualIpConfMapper;

    /**
     * 分页查询，排序功能
     * @param userTest
     * @return
     */
    @Override
    public List<UserTest> getPageList(UserTest userTest) {
        PageHelper.offsetPage(userTest.getOffset(), userTest.getLimit(), CamelCaseUtil.toUnderlineName(userTest.getSort())+" "+userTest.getOrder());
        return userTestMapper.selectAll();
    }

    /**
     * 根据条件获取总个数
     * @param example
     * @return
     *
     *  Example example = new Example(Admin.class);
     *  example.createCriteria().andCondition("username = ", admin.getUsername());
     *  Integer userCount = adminService.getCount(example);
     *
     */
    @Override
    public Integer getCount(Example example) {
        return userTestMapper.selectCountByExample(example);
    }

    /**
     * 通过id查询
     * @param id
     * @return
     */
    @Override
    public UserTest getById(String id) {
        return userTestMapper.selectByPrimaryKey(id);
    }

    /**
     * 通过名称查询
     * @param username
     * @return
     */
    @Override
    public UserTest findByUsername(String username) {
        return userTestMapper.selectByUsername(username);
    }

    /**
     * 通过主键删除
     * @param id
     */
    @Override
    public void deleteById(String id) {
        userTestMapper.deleteByPrimaryKey(id);
    }

    /**
     * 插入
     * @param userTest
     */
    @Override
    @Transactional
    public void insert(UserTest userTest) {
        for(int i=0;i<10;i++){
            userTestMapper.insert(userTest);
        }
        VirtualIpConf virtualIpConf = new VirtualIpConf();
//        virtualIpConf.setVirtualIpConfId();
        virtualIpConf.setStartIp("wph");
        virtualIpConf.setEndIp("wph");
        virtualIpConfMapper.insert(virtualIpConf);
        int i=2/0;
    }

    /**
     * 保存或者更新（有id就是更新，没id是保存操作）
     * @param userTest
     */
    @Override
    public void saveOrUpdate(UserTest userTest) {
        if (userTest.getId() != null) {
            userTestMapper.updateByPrimaryKey(userTest);
        } else {
            userTestMapper.insert(userTest);
        }
    }

    /**
     * 通过条件进行更新（可以更新多个字段）
     * @param userTest
     * @param example
     *
     *
     *   Admin pwdAdmin = new Admin();
     *   pwdAdmin.setPassword(newPassword);
     *   Example example = new Example(Admin.class);
     *   example.createCriteria().andCondition("uid=", uid);
     *   adminService.updateExample(pwdAdmin, example);
     */
    @Override
    public void updateExample(UserTest userTest, Example example) {
        userTestMapper.updateByExampleSelective(userTest, example);
    }
}

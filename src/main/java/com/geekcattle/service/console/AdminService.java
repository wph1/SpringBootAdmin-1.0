/*
 * Copyright (c) 2017 <l_iupeiyu@qq.com> All rights reserved.
 */

package com.geekcattle.service.console;

import java.util.List;

import org.omg.CORBA.SystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.geekcattle.mapper.console.AdminMapper;
import com.geekcattle.model.console.Admin;
import com.geekcattle.util.CamelCaseUtil;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;

/**
 * author geekcattle
 * date 2016/10/21 0021 下午 15:43
 */
@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> getPageList(Admin admin) {
        PageHelper.offsetPage(admin.getOffset(), admin.getLimit(), CamelCaseUtil.toUnderlineName(admin.getSort())+" "+admin.getOrder());
        return adminMapper.selectAll();
    }

    public Integer getCount(Example example){
        return adminMapper.selectCountByExample(example);
    }

    public Admin getById(String id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    public Admin findByUsername(String username) {
        return adminMapper.selectByUsername(username);
    }

    public void deleteById(String id) {
        adminMapper.deleteByPrimaryKey(id);
    }
//    @Transactional(rollbackFor={RuntimeException.class})
//    @Transactional(propagation = Propagation.REQUIRED)
//    @Transactional
//    @Transactional(rollbackFor = Exception.class)
    public void insert(Admin admin){
//    	Object  savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
//    	try {
            adminMapper.insert(admin);
//          int a=2/0;
//		} catch (Exception e) {
////			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//			TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
//		}
    }

    public void save(Admin admin) {
        if (admin.getUid() != null) {
            adminMapper.updateByPrimaryKey(admin);
        } else {
            adminMapper.insert(admin);
        }
    }

    public void updateExample(Admin admin, Example example){
        adminMapper.updateByExampleSelective(admin, example);
    }



}

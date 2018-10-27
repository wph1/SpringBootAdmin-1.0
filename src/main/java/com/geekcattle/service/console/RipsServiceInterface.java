package com.geekcattle.service.console;

import com.geekcattle.model.console.Rips;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

public interface RipsServiceInterface {


    List<Rips> getPageList(Rips network);

    Integer getCount(Example example);

    Integer getCountByNet(String input);

    Rips getById(String id);

    Rips findByname(String netname);

    Rips findById(String id);

    void deleteById(String id);

    /**
     * 删除数据，并且向odl发送指令
     * @param idList
     */
    void deleteByIdAndOdl(String[] idList);

    void insert(Rips net);
    void insertAndSendOdl(Rips net);

    void save(Rips net);

    void updateExample(Rips network, Example example);

    /**
     * 真实子网绑定交换机
     * @param map
     */
    void bingSwitches(Map map);


}

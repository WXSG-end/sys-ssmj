package com.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import com.dao.ShiyanshujuDao;
import com.entity.ShiyanshujuEntity;
import com.service.ShiyanshujuService;
import com.utils.PageUtils;
import com.utils.Query;

/**
 * 实验数据 ServiceImpl
 */
@Service("shiyanshujuService")
public class ShiyanshujuServiceImpl extends ServiceImpl<ShiyanshujuDao, ShiyanshujuEntity> implements ShiyanshujuService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShiyanshujuEntity> page = this.selectPage(
                new Query<ShiyanshujuEntity>(params).getPage(),
                new EntityWrapper<ShiyanshujuEntity>()
        );
        return new PageUtils(page);
    }
}

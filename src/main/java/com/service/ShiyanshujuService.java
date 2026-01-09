package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShiyanshujuEntity;
import java.util.Map;

/**
 * 实验数据 服务类
 * @author
 * @since 2021-02-25
 */
public interface ShiyanshujuService extends IService<ShiyanshujuEntity> {

     PageUtils queryPage(Map<String, Object> params);

}

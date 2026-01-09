package com.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.entity.ShiyanshujuEntity;
import com.service.ShiyanshujuService;
import com.utils.PageUtils;
import com.utils.R;

/**
 * 实验数据 后端接口
 */
@RestController
@Controller
@RequestMapping("/shiyanshuju")
public class ShiyanshujuController {
    private static final Logger logger = LoggerFactory.getLogger(ShiyanshujuController.class);

    @Autowired
    private ShiyanshujuService shiyanshujuService;

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params) {
        logger.debug("Controller:" + this.getClass().getName() + ",page方法");
        PageUtils page = shiyanshujuService.queryPage(params);
        return R.ok().put("data", page);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        logger.debug("Controller:" + this.getClass().getName() + ",info方法");
        ShiyanshujuEntity shiyanshuju = shiyanshujuService.selectById(id);
        if (shiyanshuju != null) {
            return R.ok().put("data", shiyanshuju);
        } else {
            return R.error(511, "查不到数据");
        }
    }

    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ShiyanshujuEntity shiyanshuju, HttpServletRequest request) {
        logger.debug("Controller:" + this.getClass().getName() + ",save");

        String username = (String) request.getSession().getAttribute("username");
        // 记录人/记录时间
        shiyanshuju.setYhnote(username);
        shiyanshuju.setNoteTime(new Date());

        // 如果有备注，但没填备注人/时间，则自动补
        if (shiyanshuju.getReply() != null && !"".equals(shiyanshuju.getReply().trim())) {
            if (shiyanshuju.getGlreply() == null || "".equals(shiyanshuju.getGlreply().trim())) {
                shiyanshuju.setGlreply(username);
            }
            if (shiyanshuju.getReplyTime() == null) {
                shiyanshuju.setReplyTime(new Date());
            }
        }

        shiyanshujuService.insert(shiyanshuju);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ShiyanshujuEntity shiyanshuju, HttpServletRequest request) {
        logger.debug("Controller:" + this.getClass().getName() + ",update");

        String username = (String) request.getSession().getAttribute("username");
        // 有备注就写备注人/备注时间
        if (shiyanshuju.getReply() != null && !"".equals(shiyanshuju.getReply().trim())) {
            shiyanshuju.setGlreply(username);
            shiyanshuju.setReplyTime(new Date());
        }

        shiyanshujuService.updateById(shiyanshuju);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        logger.debug("Controller:" + this.getClass().getName() + ",delete");
        shiyanshujuService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}

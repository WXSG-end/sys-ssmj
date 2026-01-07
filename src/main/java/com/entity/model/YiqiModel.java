package com.entity.model;

import com.entity.YiqiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 仪器
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-02-26
 */
public class YiqiModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 仪器名称 Search
     */
    private String serial;


    /**
     * 仪器类型 Search
     */
    private Integer lxTypes;


    /**
     * 归属专业 Search
     */
    private Integer zyTypes;
    private Integer resourceTypes;
    private Integer stock;
    private String unit;
    private Integer threshold;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：仪器名称 Search
	 */
    public String getSerial() {
        return serial;
    }


    /**
	 * 获取：仪器名称 Search
	 */

    public void setSerial(String serial) {
        this.serial = serial;
    }
    /**
	 * 设置：仪器类型 Search
	 */
    public Integer getLxTypes() {
        return lxTypes;
    }


    /**
	 * 获取：仪器类型 Search
	 */

    public void setLxTypes(Integer lxTypes) {
        this.lxTypes = lxTypes;
    }
    /**
	 * 设置：归属专业 Search
	 */
    public Integer getZyTypes() {
        return zyTypes;
    }


    /**
	 * 获取：归属专业 Search
	 */

    public void setZyTypes(Integer zyTypes) {
        this.zyTypes = zyTypes;
    }
    public Integer getResourceTypes() {
        return resourceTypes;
    }
    public void setResourceTypes(Integer resourceTypes) {
        this.resourceTypes = resourceTypes;
    }
    public Integer getStock() {
        return stock;
    }
    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Integer getThreshold() {
        return threshold;
    }

    public void setThreshold(Integer threshold) {
        this.threshold = threshold;
    }

    }

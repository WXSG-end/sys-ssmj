package com.entity.vo;

import com.entity.YiqiEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 仪器
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-02-26
 */
@TableName("yiqi")
public class YiqiVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 仪器名称 Search
     */

    @TableField(value = "serial")
    private String serial;


    /**
     * 仪器类型 Search
     */

    @TableField(value = "lx_types")
    private Integer lxTypes;


    /**
     * 归属专业 Search
     */

    @TableField(value = "zy_types")
    private Integer zyTypes;
    @TableField(value = "resource_types")
    private Integer resourceTypes;

    @TableField(value = "stock")
    private Integer stock;

    @TableField(value = "unit")
    private String unit;

    @TableField(value = "threshold")
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

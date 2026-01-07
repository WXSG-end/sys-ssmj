package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 仪器
 *
 * @author 
 * @email
 * @date 2021-02-26
 */
@TableName("yiqi")
public class YiqiEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public YiqiEntity() {

	}

	public YiqiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
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
    /**
     * 资源类型 Search（1设备 2耗材）
     */
    @TableField(value = "resource_types")
    private Integer resourceTypes;

    /**
     * 库存（耗材）
     */
    @TableField(value = "stock")
    private Integer stock;

    /**
     * 单位（耗材）
     */
    @TableField(value = "unit")
    private String unit;

    /**
     * 预警阈值（耗材）
     */
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

package com.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * 实验数据信息
 *
 * @author
 * @date 2021-02-25
 */
@TableName("shiyanshuju")
public class ShiyanshujuEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    public ShiyanshujuEntity() {
    }

    public ShiyanshujuEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")
    private Integer id;

    /**
     * 实验数据内容
     */
    @TableField(value = "note")
    private String note;

    /**
     * 记录人
     */
    @TableField(value = "yhnote")
    private String yhnote;

    /**
     * 记录时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    @TableField(value = "note_time")
    private Date noteTime;

    /**
     * 备注
     */
    @TableField(value = "reply")
    private String reply;

    /**
     * 备注人
     */
    @TableField(value = "glreply")
    private String glreply;

    /**
     * 备注时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    @TableField(value = "reply_time")
    private Date replyTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getYhnote() {
        return yhnote;
    }

    public void setYhnote(String yhnote) {
        this.yhnote = yhnote;
    }

    public Date getNoteTime() {
        return noteTime;
    }

    public void setNoteTime(Date noteTime) {
        this.noteTime = noteTime;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getGlreply() {
        return glreply;
    }

    public void setGlreply(String glreply) {
        this.glreply = glreply;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }
}

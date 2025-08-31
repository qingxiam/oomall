package cn.edu.xmu.oomall.freight.dao.bo;

import cn.edu.xmu.javaee.core.clonefactory.CopyFrom;
import cn.edu.xmu.javaee.core.model.OOMallObject;
import cn.edu.xmu.oomall.freight.controller.dto.UndeliverableDto;
import cn.edu.xmu.oomall.freight.dao.LogisticsDao;
import cn.edu.xmu.oomall.freight.dao.openfeign.RegionDao;
import cn.edu.xmu.oomall.freight.mapper.po.UndeliverablePo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * 2024-dsg-112
 *
 * @author Hao Chen
 * 不可送达地区bo对象
 */
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@ToString(callSuper = true, doNotUseGetters = true)
@CopyFrom({UndeliverablePo.class, UndeliverableDto.class})
public class Undeliverable extends OOMallObject implements Serializable {

    @Setter
    @JsonIgnore
    @ToString.Exclude
    private RegionDao regionDao;

    private Long regionId;

    @JsonIgnore
    @ToString.Exclude
    private Region region;

    public Region getRegion() {
        if (Objects.isNull(this.region) && Objects.nonNull(this.regionDao)) {
            this.region = this.regionDao.findById(this.regionId);
        }
        return this.region;
    }

    private LocalDateTime beginTime;

    private LocalDateTime endTime;

    @Setter
    @JsonIgnore
    @ToString.Exclude
    private LogisticsDao logisticsDao;

    private Long logisticsId;

    @ToString.Exclude
    @JsonIgnore
    private Logistics logistics;

    public Logistics getLogistics() {
        if (Objects.isNull(this.logistics) && Objects.nonNull(this.logisticsDao)) {
            this.logistics = this.logisticsDao.findById(this.logisticsId);
        }
        return this.logistics;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public Long getModifierId() {
        return modifierId;
    }

    public void setModifierId(Long modifierId) {
        this.modifierId = modifierId;
    }

    public String getModifierName() {
        return modifierName;
    }

    public void setModifierName(String modifierName) {
        this.modifierName = modifierName;
    }

    public LocalDateTime getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(LocalDateTime gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public LocalDateTime getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(LocalDateTime gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Long getRegionId() {
        return regionId;
    }

    public void setRegionId(Long regionId) {
        this.regionId = regionId;
    }

    public LocalDateTime getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(LocalDateTime beginTime) {
        this.beginTime = beginTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public Long getLogisticsId() {
        return logisticsId;
    }

    public void setLogisticsId(Long logisticsId) {
        this.logisticsId = logisticsId;
    }

}

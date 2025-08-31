package cn.edu.xmu.oomall.shop.dao.bo.template;

import cn.edu.xmu.javaee.core.clonefactory.CopyFrom;
import cn.edu.xmu.javaee.core.exception.BusinessException;
import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.OOMallObject;
import cn.edu.xmu.oomall.shop.dao.bo.Region;
import cn.edu.xmu.oomall.shop.dao.bo.divide.DivideStrategy;
import cn.edu.xmu.oomall.shop.dao.openfeign.RegionDao;
import lombok.extern.slf4j.Slf4j;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.oomall.shop.dao.template.RegionTemplateDao;
import cn.edu.xmu.oomall.shop.mapper.po.TemplatePo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * 运费模板对象
 */
@ToString(callSuper = true, doNotUseGetters = true)
@NoArgsConstructor
@CopyFrom(TemplatePo.class)
@Slf4j
public class Template extends OOMallObject implements Serializable, Cloneable {
    /**
     * 默认模板
     */
    @ToString.Exclude
    @JsonIgnore
    public static final Byte DEFAULT = 1;

    @ToString.Exclude
    @JsonIgnore
    public static final Byte COMMON = 0;

    @ToString.Exclude
    @JsonIgnore
    public static final String PIECE = "pieceTemplateDao";

    @ToString.Exclude
    @JsonIgnore
    public static final String WEIGHT = "weightTemplateDao";

    @ToString.Exclude
    @JsonIgnore
    public static Map<String, TemplateType> TYPE = new HashMap<>() {
        {
            put(PIECE, new Piece());
            put(WEIGHT, new Weight());
        }
    };

    /**
     * 商铺id
     */
    @Setter
    @Getter
    private Long shopId;

    /**
     * 模板名称
     */
    @Setter
    @Getter
    private String name;

    /**
     * 1 默认
     */
    @Setter
    @Getter
    private Byte defaultModel;

    /**
     * 模板类名
     */
    @Setter
    @Getter
    protected String templateBean;

    /**
     * 分包策略
     */
    @Setter
    @Getter
    protected String divideStrategy;

    @Getter
    @Setter
    protected DivideStrategy strategy;
    /**
     * 打包算法
     */
    @Setter
    @Getter
    protected String packAlgorithm;


    public TemplateType gotType() {
        assert this.templateBean != null;
        return TYPE.get(this.templateBean);
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        Template template = (Template) super.clone();
        template.setDefaultModel(COMMON);
        return template;
    }

    @ToString.Exclude
    @JsonIgnore
    @Setter
    private RegionTemplateDao regionTemplateDao;

    @ToString.Exclude
    @JsonIgnore
    @Setter
    private RegionDao regionDao;
    /**
     * 更新地区的运费模板
     *
     * @param regionTemplate1   地区模板值
     * @param user 操作者
     * @return 影响的key
     */
    public String updateRegionTemplate(RegionTemplate regionTemplate1, UserToken user) {
        Optional<RegionTemplate> regionTemplate = this.regionTemplateDao.retrieveByTemplateAndRegionId(this, regionTemplate1.getRegionId());
        RegionTemplate oldBo = null;
        if (regionTemplate.isPresent()) {
            oldBo = regionTemplate.get();
        } else {
            throw new BusinessException(ReturnNo.RESOURCE_ID_NOTEXIST);
        }
        regionTemplate1.setId(oldBo.getId());
        log.debug("oldBo = {}", oldBo);
        regionTemplate1.setObjectId(oldBo.getObjectId());
        return this.regionTemplateDao.save(this, regionTemplate1, user);
    }

    /**
     * 创建地区模板
     * @param clazz 模板类别
     * @param regionTemplate 地区模板值对象
     * @param user 创建用户
     */
    public void createRegionTemplate(Class clazz, RegionTemplate regionTemplate, UserToken user){
        if (!this.gotType().getClass().equals(clazz)){
            throw new BusinessException(ReturnNo.FREIGHT_TEMPLATENOTMATCH);
        }
        this.regionTemplateDao.insert(this,regionTemplate,user);
    }

    /**
     * 根据运费模板id和地区id来查找地区模板信息
     * 如果没有与rid对应的地区模板，则会继续查询rid最近的上级地区模板
     * 用于计算运费
     *
     * @param regionId 地区id
     * @return 地区运费模板
     */
    public RegionTemplate findRegionTemplate(Long regionId){
        Optional<RegionTemplate> ret = this.regionTemplateDao.retrieveByTemplateAndRegionId(this, regionId);
        //若没有与rid对应的地区模板，继续查找最近的上级地区模板
        if (ret.isEmpty()) {
            List<Region> pRegions = this.regionDao.retrieveParentRegionsById(regionId);
            /*
             * 由近到远查询地区模板,只要找到一个不为空的地区模板就结束查询
             */
            for (Region r : pRegions) {
                ret = this.regionTemplateDao.retrieveByTemplateAndRegionId(this, r.getId());
                if (ret.isPresent()) {
                    break;
                }
            }
        }
        if (ret.isPresent()) {
            RegionTemplate bo = ret.get();
            log.debug("findByTemplateIdAndRegionId: regionTemplate={}", bo);
            return bo;
        } else {
            throw new BusinessException(ReturnNo.RESOURCE_ID_NOTEXIST);
        }
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
}

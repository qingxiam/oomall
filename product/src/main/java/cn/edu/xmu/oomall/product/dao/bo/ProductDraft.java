//School of Informatics Xiamen University, GPL-3.0 license

package cn.edu.xmu.oomall.product.dao.bo;

import cn.edu.xmu.javaee.core.clonefactory.CopyFrom;
import cn.edu.xmu.javaee.core.exception.BusinessException;
import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.OOMallObject;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.javaee.core.model.returnval.TwoTuple;
import cn.edu.xmu.javaee.core.util.CloneFactory;
import cn.edu.xmu.oomall.product.dao.CategoryDao;
import cn.edu.xmu.oomall.product.dao.ProductDao;
import cn.edu.xmu.oomall.product.dao.ProductDraftDao;
import cn.edu.xmu.oomall.product.dao.openfeign.ShopDao;
import cn.edu.xmu.oomall.product.mapper.openfeign.po.Shop;
import cn.edu.xmu.oomall.product.mapper.po.ProductDraftPo;
import cn.edu.xmu.oomall.product.controller.dto.ProductDraftDto;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import lombok.extern.slf4j.Slf4j;


import java.io.Serializable;
import java.time.LocalDateTime;

@Slf4j
@NoArgsConstructor
@ToString(callSuper = true, doNotUseGetters = true)
@CopyFrom({ ProductDraftDto.class, ProductDraftPo.class })
public class ProductDraft extends OOMallObject implements Serializable {

    @ToString.Exclude
    @JsonIgnore
    private final static Long NO_ORIGIN_PRODUCT = 0L;

    @Setter
    @ToString.Exclude
    @JsonIgnore
    private ProductDraftDao productDraftDao;

    @ToString.Exclude
    @Setter
    @JsonIgnore
    private CategoryDao categoryDao;

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private Long originalPrice;

    @Getter
    @Setter
    private String originPlace;

    @Getter
    @Setter
    private Long shopId;

    @Getter
    @Setter
    private String unit;


    @Setter
    @JsonIgnore
    @ToString.Exclude
    private ShopDao shopDao;

    @JsonIgnore
    @ToString.Exclude
    private Shop shop;

    public Shop getShop() {
        if (this.shop == null && this.shopDao != null) {
            this.shop = this.shopDao.findById(this.shopId);
        }
        return this.shop;
    }

    @Getter
    @Setter
    private Long categoryId;

    public Category getCategory() {
        if (this.categoryId == null) {
            return null;
        }

        if (null == this.category && null != this.categoryDao) {
            try {
                this.category = this.categoryDao.findById(this.categoryId);
            } catch (BusinessException e) {
                if (ReturnNo.RESOURCE_ID_NOTEXIST == e.getErrno()) {
                    this.categoryId = null;
                    log.error("getCategory: product(id = {})'s categoryId is invalid.", id);
                }
            }
        }
        return this.category;
    }

    @JsonIgnore
    @ToString.Exclude
    private Category category;

    @Getter
    @Setter
    private Long productId;

    @JsonIgnore
    @ToString.Exclude
    private Product product;

    @Setter
    @JsonIgnore
    @ToString.Exclude
    private ProductDao productDao;

    public Product getProduct() {
        if (this.productId == null) {
            return null;
        }

        if (this.product == null && this.productDao != null) {
            this.product = this.productDao.findNoOnsaleById(this.shopId, this.productId);
        }
        return this.product;
    }

    /**
     * 发布商品
     * 
     * @param commissionRatio 分账比例（可以为空）
     * @param user            操作者
     * @return 修改或新增的Product以及修改的Redis key
     */
    public TwoTuple<Product, String> publish(Integer commissionRatio, UserToken user) {
        String key = null;
        Product retObj = null;
        Product productVal = CloneFactory.copy(new Product(), this);
        productVal.setCommissionRatio(commissionRatio);
        if (NO_ORIGIN_PRODUCT == this.productId) {
            // 新增的货品
            productVal.setStatus(Product.ONSHELF);
            productVal.setGoodsId(Product.NO_RELATE_PRODUCT);
            retObj = this.productDao.insert(productVal, user);
        } else {
            // 修改货品
            productVal.setId(this.productId);
            key = this.productDao.save(productVal, user);
            retObj = productVal;
        }
        this.productDraftDao.delete(id);
        return new TwoTuple<>(retObj, key);
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

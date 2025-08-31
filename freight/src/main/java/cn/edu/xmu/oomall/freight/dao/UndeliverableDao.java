package cn.edu.xmu.oomall.freight.dao;

import cn.edu.xmu.javaee.core.exception.BusinessException;
import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.javaee.core.util.CloneFactory;
import cn.edu.xmu.oomall.freight.dao.bo.Undeliverable;
import cn.edu.xmu.oomall.freight.dao.openfeign.RegionDao;
import cn.edu.xmu.oomall.freight.mapper.jpa.UndeliverablePoMapper;
import cn.edu.xmu.oomall.freight.mapper.po.UndeliverablePo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Repository
@Slf4j
@RequiredArgsConstructor
public class UndeliverableDao {

    private final RegionDao regionDao;

    private final LogisticsDao logisticsDao;

    private final UndeliverablePoMapper undeliverablePoMapper;

    /**
     * 2024-dsg-112
     *
     * @author Hao Chen
     * 创建满血不可达地区bo对象
     */
    public Undeliverable build(Undeliverable undeliverable) {
        undeliverable.setRegionDao(this.regionDao);
        undeliverable.setLogisticsDao(this.logisticsDao);
        return undeliverable;
    }

    /**
     * 2024-dsg-112
     *
     * @author Hao Chen
     * 新增不可达地区
     */
    public void insert(Undeliverable undeliverable, UserToken user) {
        // 调用regionDao的getRegionById方法，从而触发对regionId的校验
        undeliverable.getRegion();
        undeliverable.setCreatorId(user.getId());
        undeliverable.setGmtCreate(LocalDateTime.now());
        UndeliverablePo po = CloneFactory.copy(new UndeliverablePo(), undeliverable);
        po.setId(null);
        log.debug("insert undeliverablePo = {}", po);
        this.undeliverablePoMapper.save(po);
        undeliverable.setId(po.getId());
    }

    /**
     * 2024-dsg-112
     *
     * @author Hao Chen
     * 删除不可达地区
     */
    public void delete(Long regionId, Long logisticsId, UserToken user) {
        UndeliverablePo po = undeliverablePoMapper.findByRegionIdAndLogisticsId(regionId, logisticsId);
        if (Objects.isNull(po)) {
            throw new BusinessException(ReturnNo.RESOURCE_ID_NOTEXIST);
        }
        this.undeliverablePoMapper.deleteById(po.getId());
    }

    /**
     * 2024-dsg-112
     *
     * @author Hao Chen
     * 获取不可达地区
     */
    public List<Undeliverable> retrieveByLogisticsId(Long logisticsId, Integer page, Integer pageSize) {
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        return this.undeliverablePoMapper.findAllByLogisticsId(logisticsId, pageable).stream()
                .map(po -> {
                    Undeliverable bo = CloneFactory.copy(new Undeliverable(), po);
                    bo = build(bo);
                    return bo;
                })
                .collect(Collectors.toList());
    }
}

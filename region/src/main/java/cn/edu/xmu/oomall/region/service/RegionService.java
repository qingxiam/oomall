//School of Informatics Xiamen University, GPL-3.0 license
package cn.edu.xmu.oomall.region.service;

import cn.edu.xmu.javaee.core.exception.BusinessException;
import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.StatusDto;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.javaee.core.mapper.RedisUtil;
import cn.edu.xmu.oomall.region.dao.RegionDao;
import cn.edu.xmu.oomall.region.dao.bo.Region;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(propagation = Propagation.REQUIRED)
@RequiredArgsConstructor
@Slf4j
public class RegionService {

    private final RegionDao regionDao;
    private final RedisUtil redisUtil;


    /**
     * 获取所有的下级地区
     *
     * @param id                 父地区id
     * @param page               页码
     * @param pageSize           页大小
     * @return PageDto
     */
    public List<Region> retrieveSubRegionsById(Long id, Integer page, Integer pageSize) {
        this.regionDao.findById(id);
        return this.regionDao.retrieveSubRegionsById(id, page, pageSize);
    }

    /**
     * 获取有效的下级地区
     *
     * @param id                 父地区id
     * @param page               页码
     * @param pageSize           页大小
     * @return PageDto
     */
    public List<Region> retrieveValidSubRegionsById(Long id, Integer page, Integer pageSize) {
        this.regionDao.findById(id);
        return this.regionDao.retrieveSubRegionsById(id, page, pageSize).stream().filter(region -> region.getStatus().equals(Region.VALID)).collect(Collectors.toList());
    }

    /**
     * 创建新的子地区
     *
     * @param id region id
     * @param region 下级region对象
     * @param user 登录用户
     * @return 新region对象，带id
     */
    public Region createSubRegions(Long id, Region region, UserToken user) {
        Region parent = this.regionDao.findById(id);
        return parent.createSubRegion(region, user);
    }

    /**
     * 通过id更新地区
     * 废弃地区不能修改
     * @param region   地区
     * @param user 登录用户
     */

    public void updateById(Region region, UserToken user) {
        Region bo = this.regionDao.findById(region.getId());
        log.debug("updateRegionById: bo = {}", bo);
        if (Region.ABANDONED.equals(bo.getStatus())) {
            throw new BusinessException(ReturnNo.REGION_ABANDONE, String.format(ReturnNo.REGION_ABANDONE.getMessage(), region.getId()));
        }
        String key = this.regionDao.save(region, user);
        this.redisUtil.del(key);
    }

    /**
     * 取消地区，会取消子地区
     *
     * @param id     地区id
     * @param user   操作者
     */
    public void abandonRegion(Long id, UserToken user) {
        Region region = this.regionDao.findById(id);
        List<String> keys = region.abandon(user);
        this.redisUtil.del(keys.toArray(new String[0]));
    }

    /**
     * 暂停地区，会暂停子地区
     * @param user   操作者
     * @param id     地区id
     */
    public void suspendRegion(Long id, UserToken user) {
        Region region = this.regionDao.findById(id);
        List<String> keys = region.suspend(user);
        this.redisUtil.del(keys.toArray(new String[0]));
    }

    /**
     * 恢复地区，会恢复子地区
     * @param user   操作者
     * @param id     地区id
     */
    public void resumeRegion(Long id, UserToken user) {
        Region region = this.regionDao.findById(id);
        List<String> keys = region.resume(user);
        this.redisUtil.del(keys.toArray(new String[0]));
    }

    /**
     * 获取所有地区状态
     *
     * @return
     */
    public List<StatusDto> retrieveRegionsStates() {
        return Region.STATUSNAMES.keySet().stream().map(key -> new StatusDto(key, Region.STATUSNAMES.get(key))).collect(Collectors.toList());
    }

    /**
     * 通过id查找地区
     *
     * @param id 地区id
     * @return RegionDto
     */
    public Region findById(Long id) {
        log.debug("findRegionById: id = {}", id);
        return this.regionDao.findById(id);
    }

    /**
     * 通过id查找所有上级地区
     * @param id 地区id
     * @return 上级地区列表
     */
    public List<Region> retrieveParentsRegionsById(Long id) {
        log.debug("retrieveParentsRegionsById: id = {}", id);
        Region region = this.regionDao.findById(id);
        return region.getAncestors();
    }
}

package cn.edu.xmu.oomall.freight.dao;

import cn.edu.xmu.javaee.core.exception.BusinessException;
import cn.edu.xmu.javaee.core.mapper.RedisUtil;
import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.javaee.core.util.CloneFactory;
import cn.edu.xmu.oomall.freight.dao.bo.Contract;
import cn.edu.xmu.oomall.freight.dao.logistics.LogisticsAdaptorFactory;
import cn.edu.xmu.oomall.freight.mapper.jpa.ContractPoMapper;
import cn.edu.xmu.oomall.freight.mapper.po.ContractPo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import static cn.edu.xmu.javaee.core.model.Constants.PLATFORM;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 */
@Repository
@Slf4j
public class ContractDao {
    public static final String KEY = "SL%d";

    private final RedisUtil redisUtil;
    private final ExpressDao expressDao;
    private final LogisticsAdaptorFactory factory;
    private final LogisticsDao logisticsDao;
    private final ContractPoMapper contractPoMapper;

    @Value("${oomall.freight.shop-logistics.timeout}")
    private int timeout;

    @Autowired
    @Lazy
    public ContractDao(RedisUtil redisUtil, ContractPoMapper contractPoMapper,
                       ExpressDao expressDao, LogisticsAdaptorFactory factory, LogisticsDao logisticsDao) {
        this.redisUtil = redisUtil;
        this.contractPoMapper = contractPoMapper;
        this.expressDao = expressDao;
        this.factory = factory;
        this.logisticsDao = logisticsDao;
    }

    private void build(Contract bo){
        bo.setExpressDao(this.expressDao);
        bo.setLogisticsDao(this.logisticsDao);
        bo.setLogisticsAdaptor(this.factory);
    }


    private Contract build(ContractPo po, Optional<String> redisKey) throws RuntimeException{
        Contract bo = CloneFactory.copy(new Contract(), po);
        this.build(bo);
        redisKey.ifPresent(key -> redisUtil.set(key, bo, timeout));
        return bo;
    }

    /**
     * 插入店铺物流
     *
     * @param contract
     * @param user
     *
     * @return
     */
    public Contract insert(Contract contract, UserToken user) throws RuntimeException {

        contract.setInvalid(Contract.VALID);
        contract.setGmtCreate(LocalDateTime.now());
        contract.setGmtModified(null);
        contract.setCreator(user);

        ContractPo savedPo = contractPoMapper.save(CloneFactory.copy(new ContractPo(), contract));
        contract.setId(savedPo.getId());
        return contract;
    }


    /**
     * 修改店铺物流
     *
     * @param bo
     *
     * @return
     */
    public void save(Contract bo, UserToken user) throws RuntimeException {
        bo.setModifierId(user.getId());
        bo.setModifierName(user.getName());
        bo.setGmtModified(LocalDateTime.now());
        contractPoMapper.save(CloneFactory.copy(new ContractPo(), bo));

    }


    public Contract findById(Long shopId, Long id) throws RuntimeException{
        if (null == id) {
            throw new IllegalArgumentException("ShopLogistics.findById: shopLogistic id is null");
        }
        log.debug("findObjById: id = {}", id);
        String key = String.format(KEY, id);

        Contract contract = (Contract) redisUtil.get(key);
        if (contract != null) {
            this.build(contract);
            log.debug("redis shopLogistics = {}", contract);
            if(!PLATFORM.equals(shopId) && !shopId.equals(contract.getShopId())){
                throw new BusinessException(ReturnNo.RESOURCE_ID_OUTSCOPE, String.format(ReturnNo.RESOURCE_ID_OUTSCOPE.getMessage(), "商铺物流", id, shopId));
            }
            return contract;
        } else {
            Optional<ContractPo> po = this.contractPoMapper.findById(id);
            if (po.isPresent()) {
                if(!po.get().getShopId().equals(shopId))
                    throw new BusinessException(ReturnNo.RESOURCE_ID_OUTSCOPE, String.format(ReturnNo.RESOURCE_ID_OUTSCOPE.getMessage(), "商铺物流", id, shopId));
                return this.build(po.get(), Optional.of(key));
            }
            throw new BusinessException(ReturnNo.RESOURCE_ID_NOTEXIST, String.format(ReturnNo.RESOURCE_ID_NOTEXIST.getMessage(), "商铺物流", id));
        }
    }

    /**
     * @author 37220222203558
     * 2024-dsg116
     */
    public List<Contract> findByWarehouseId(Long warehouseId) throws RuntimeException{
        List<ContractPo> poList = contractPoMapper.findAllByWarehouseId(warehouseId);
        List<Contract> boList = new ArrayList<>();
        for(ContractPo po : poList){
            boList.add(CloneFactory.copy(new Contract(), po));
        }
        return boList;
    }

    public void deleteContract(Long shopId, Long id) {
        this.findById(shopId,id);
        //deleteById方法的返回值为void
        this.contractPoMapper.deleteById(id);
    }

    /**
     * 2024-dsg-115
     * @author liboyang
     * 获得仓库物流的月结合同
     */
    public List<Contract> retrieveByWareHouseId(Long shopId,Long warehouseId,Integer page, Integer pageSize) {
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        return this.contractPoMapper.findAllByShopIdAndWarehouseIdOrderByPriorityAsc(shopId,warehouseId,pageable).stream()
                .map(po -> {
                    Contract bo = CloneFactory.copy(new Contract(), po);
                    this.build(bo);
                    return bo;
                })
                .collect(java.util.stream.Collectors.toList());
    }
}

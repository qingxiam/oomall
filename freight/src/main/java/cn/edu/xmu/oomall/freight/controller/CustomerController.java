package cn.edu.xmu.oomall.freight.controller;

import cn.edu.xmu.javaee.core.model.ReturnNo;
import cn.edu.xmu.javaee.core.model.ReturnObject;
import cn.edu.xmu.javaee.core.model.IdNameTypeVo;
import cn.edu.xmu.javaee.core.model.UserToken;
import cn.edu.xmu.javaee.core.model.PageDto;
import cn.edu.xmu.javaee.core.util.CloneFactory;
import cn.edu.xmu.oomall.freight.controller.vo.ExpressVo;
import cn.edu.xmu.oomall.freight.controller.vo.UndeliverableVo;
import cn.edu.xmu.oomall.freight.dao.bo.Express;
import cn.edu.xmu.oomall.freight.dao.bo.Logistics;
import cn.edu.xmu.oomall.freight.dao.bo.Undeliverable;
import cn.edu.xmu.oomall.freight.service.ExpressService;
import cn.edu.xmu.oomall.freight.service.LogisticsService;
import cn.edu.xmu.oomall.freight.service.UndeliverableService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static cn.edu.xmu.javaee.core.model.Constants.PLATFORM;

/**
 * @author fan ninghan
 * 2023-dng3-008
 */
@RestController
@RequiredArgsConstructor
public class CustomerController {

    private final LogisticsService logisticsService;

    private final UndeliverableService undeliverableService;

    private final ExpressService expressService;

    /**
     * 2024-dsg-114
     * 根据物流单号查询属于哪家物流公司
     */
    @GetMapping("/logistics")
    public ReturnObject getLogisticsCompany(@RequestParam(required = false) String billCode,
                                            @cn.edu.xmu.javaee.core.aop.LoginUser UserToken user) {
        if(Objects.nonNull(billCode)) {
            Optional<Logistics> logisticsOpt = this.logisticsService.getCompanyByBillCode(billCode);
            return logisticsOpt.map(logistics -> new ReturnObject(ReturnNo.OK, IdNameTypeVo.builder().id(logistics.getId()).name(logistics.getName()).build()))
                    .orElseGet(() -> new ReturnObject(ReturnNo.RESOURCE_ID_NOTEXIST));
        }
        return new ReturnObject(ReturnNo.OK,this.logisticsService.getAllCompany());
    }

    /**
     * 2024-dsg-112
     *
     * @author Hao Chen
     * 获取无法配送的地区
     */
    @GetMapping("/logistics/{id}/undeliverableregions")
    public ReturnObject getUndeliverableRegion(@PathVariable Long id,
                                               @RequestParam(required = false, defaultValue = "1") Integer page,
                                               @RequestParam(required = false, defaultValue = "10") Integer pageSize){
        List<Undeliverable> undeliverableRegions = undeliverableService.retrieveUndeliverableRegion(id, page, pageSize);
        List<UndeliverableVo> undeliverableVos = undeliverableRegions.stream()
                .map(bo -> CloneFactory.copy(new UndeliverableVo(bo), bo))
                .collect(java.util.stream.Collectors.toList());
        return new ReturnObject(new PageDto<>(undeliverableVos, page, pageSize));
    }

    /**
     * 2024-dsg-113
     * 根据运单号获取运单信息
     */
    @GetMapping("/packages")
    @Transactional(propagation = Propagation.REQUIRED)
    public ReturnObject getPackage(@RequestParam String billCode) {
        Express express = this.expressService.retrieveExpressByBillCode(PLATFORM, billCode);
        if (Objects.nonNull(express)){
            return new ReturnObject(new ExpressVo(express));
        }
        else return new ReturnObject();
    }

    /**
     * 2024-dsg-113
     * 根据运单id获取运单信息
     */
    @GetMapping("/packages/{id}")
    @Transactional(propagation = Propagation.REQUIRED)
    public ReturnObject getPackageById(@PathVariable Long id) {
        Express express = this.expressService.findExpressById(PLATFORM, id);
        return new ReturnObject(new ExpressVo(express));
    }

}

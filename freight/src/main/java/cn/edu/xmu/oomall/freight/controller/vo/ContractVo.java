package cn.edu.xmu.oomall.freight.controller.vo;

import cn.edu.xmu.javaee.core.clonefactory.CopyFrom;
import cn.edu.xmu.javaee.core.model.IdNameTypeVo;
import cn.edu.xmu.oomall.freight.dao.bo.Contract;
import cn.edu.xmu.oomall.freight.dao.bo.Logistics;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@CopyFrom(Contract.class)
public class ContractVo {
    private Long id;
    private IdNameTypeVo logistics;
    private Byte invalid;
    private String account;
    private java.time.LocalDateTime beginTime;
    private java.time.LocalDateTime endTime;
    private Integer priority;
    private Integer quota;
    private java.time.LocalDateTime gmtCreate;
    private java.time.LocalDateTime gmtModified;
    private IdNameTypeVo creator;
    private IdNameTypeVo modifier;
    public void setLogistics(Logistics logistics)
    {
        this.logistics= IdNameTypeVo.builder().name(logistics.getName()).build();
    }
}

package cn.edu.xmu.oomall.freight.controller.dto;

import cn.edu.xmu.javaee.core.clonefactory.CopyTo;
import cn.edu.xmu.oomall.freight.dao.bo.Warehouse;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 37220222203558
 * 2024-dsg116
 */
@NoArgsConstructor
@Data
@CopyTo(Warehouse.class)
public class WarehouseDto {
    private String name;

    private String address;

    private Long regionId;

    private String senderName;

    private String senderMobile;
}

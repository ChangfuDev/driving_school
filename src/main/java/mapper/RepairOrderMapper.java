package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.RepairOrder;

public interface RepairOrderMapper {
	List<RepairOrder> getRepairOrderById(@Param("carId") Integer carId);
	Integer getRepairOrderNumById(@Param("carId") Integer carId);
	int addNewRepairOrder(RepairOrder repairOrder);
}

package service;

import java.util.List;

import entity.RepairOrder;
import service.ex.NoRepairOrderFoundException;

public interface IRepairOrderService {
	List<RepairOrder> getRepairOrderById(Integer carId) throws NoRepairOrderFoundException;
	Integer getRepairOrderNumById(Integer carId);
	int addNewRepairOrder(Integer carId,Integer devId,String repName,String repLocation,String repTime);
}

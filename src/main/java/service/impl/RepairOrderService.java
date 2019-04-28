package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.RepairOrder;
import mapper.RepairOrderMapper;
import service.IRepairOrderService;
import service.ex.NoRepairOrderFoundException;

@Service
public class RepairOrderService implements IRepairOrderService {

	@Resource
	RepairOrderMapper repairOrderMapper;
	
	@Override
	public List<RepairOrder> getRepairOrderById(Integer carId)
			throws NoRepairOrderFoundException {
		List<RepairOrder> list=repairOrderMapper.getRepairOrderById(carId);
		if(list.isEmpty()) {
			throw new NoRepairOrderFoundException("没有该车的维修记录");
		}else {
			return list;
		}
	}

	@Override
	public Integer getRepairOrderNumById(Integer carId) {
		int n=repairOrderMapper.getRepairOrderNumById(carId);
		return n;
	}

	@Override
	public int addNewRepairOrder(Integer carId, Integer devId, String repName,
			String repLocation, String repTime) {
		RepairOrder repairOrder=new RepairOrder(0, carId, repName, repLocation, repTime);
		int n=repairOrderMapper.addNewRepairOrder(repairOrder);
		return n;
	}

}

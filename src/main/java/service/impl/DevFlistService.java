package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.DevFlist;
import entity.Finance;
import mapper.DevFlistMapper;
import mapper.DeviceMapper;
import mapper.FinanceMapper;
import service.IDevFlistService;
import service.ex.StoreNotEnoughException;

@Service
public class DevFlistService implements IDevFlistService {

	@Resource
	DevFlistMapper devFlistMapper;
	
	@Resource
	DeviceMapper deviceMapper;
	
	@Resource
	FinanceMapper financeMapper;
	
	@Override
	public int addDevicesIn(Integer devId, Float price, Integer count,
			String pS, String flistTime, String supplier) {
		DevFlist devFlist=new DevFlist(0, "",devId, price, count, 1, pS, flistTime, supplier);
		int n=devFlistMapper.addDevices(devFlist);
		deviceMapper.updateStore(count, devId);
		Finance finance=new Finance(0, pS, -price*count, "仓库进单", flistTime);
		financeMapper.addNewFinance(finance);
		return n;
	}

	@Override
	public int addDevicesOut(Integer devId, Float price, Integer count,
			String pS, String flistTime, String supplier)
			throws StoreNotEnoughException {
		int store=deviceMapper.checkStore(devId);
		if(store<count) {
			throw new StoreNotEnoughException("该货物库存不足,出库单申请失败");
		}else {
			DevFlist devFlist=new DevFlist(0,"", devId, price, count, 0, pS, flistTime, supplier);
			int n=devFlistMapper.addDevices(devFlist);
			deviceMapper.updateStore(-count, devId);
			Finance finance=new Finance(0, pS, price*count, "仓库出单", flistTime);
			financeMapper.addNewFinance(finance);
			return n;
		}
	}

	@Override
	public List<DevFlist> getAllDevFlist() {
		List<DevFlist> list=devFlistMapper.getAllDevFlist();
		return list;
	}

}

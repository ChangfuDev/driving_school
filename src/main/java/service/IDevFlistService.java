package service;

import java.util.List;

import entity.DevFlist;
import service.ex.StoreNotEnoughException;

public interface IDevFlistService {
	int addDevicesIn(Integer devId, Float price, Integer count, String pS, String flistTime, String supplier);
	int addDevicesOut(Integer devId, Float price, Integer count, String pS, String flistTime, String supplier) throws StoreNotEnoughException;
	List<DevFlist> getAllDevFlist();
}

package service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.DevStore;
import entity.Device;
import mapper.DeviceMapper;
import service.IDeviceService;

@Service
public class DeviceService implements IDeviceService {

	@Resource
	DeviceMapper deviceMapper;
	
	@Override
	public List<Device> getDevices() {
		List<Device> list=new ArrayList<>();
		list=deviceMapper.getDevices();
		return list;
	}

	@Override
	public List<DevStore> getAllDevStore() {
		List<DevStore> list;
		list=deviceMapper.getAllDevStore();
		return list;
	}

}

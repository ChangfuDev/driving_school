package service;

import java.util.List;

import entity.DevStore;
import entity.Device;

public interface IDeviceService {
	List<Device> getDevices();
	List<DevStore> getAllDevStore();
}

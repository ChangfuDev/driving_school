package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.DevStore;
import entity.Device;

public interface DeviceMapper {
	List<Device> getDevices();
	int checkStore(@Param("devId") Integer devId);
	int updateStore(@Param("changeCount") Integer changeCount,@Param("devId") Integer devId);
	List<DevStore> getAllDevStore();
}

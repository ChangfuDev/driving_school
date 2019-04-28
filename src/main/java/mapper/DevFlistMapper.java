package mapper;

import java.util.List;

import entity.DevFlist;

public interface DevFlistMapper {
	int addDevices(DevFlist devFlist);
	List<DevFlist> getAllDevFlist();
}

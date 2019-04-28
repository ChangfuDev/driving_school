package mapper;

import org.apache.ibatis.annotations.Param;

import entity.Admin;

public interface AdminMapper {
	Admin getAdminById(@Param("adminId") String adminId);
	int insertAdmin(Admin admin);
}

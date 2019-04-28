package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.UserCoach;

public interface UserCoachMapper {
	List<UserCoach> getCoaches();
	UserCoach getCoachById(@Param("coachId") Integer coachId);
	int insertCoach(UserCoach userCoach);
	int updateCoach(UserCoach userCoach);
}

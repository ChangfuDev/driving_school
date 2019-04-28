package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Enroll;
import entity.UserLearner;

public interface UserLearnerMapper {
	List<UserLearner> getLearners();
	UserLearner getLearnerById(@Param("learnerId") String learnerId);
	int updateLearner(UserLearner userLearner);
	int insertLearner(UserLearner userLearner);
	int insertEnroll(Enroll enroll);
	List<Enroll> getAllEnroll();
}

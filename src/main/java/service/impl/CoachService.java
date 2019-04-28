package service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import entity.UserCoach;
import mapper.UserCoachMapper;
import service.ICoachService;
import service.ex.NoCoachFoundException;

@Service
public class CoachService implements ICoachService {

	@Resource
	UserCoachMapper mapper;
	
	@Override
	public List<UserCoach> getCoaches() {
		List<UserCoach> list=new ArrayList<>();
		list=mapper.getCoaches();
		return list;
	}

	@Override
	public UserCoach getCoachById(Integer coachId) throws NoCoachFoundException {
		UserCoach userCoach=mapper.getCoachById(coachId);
		if(userCoach==null) {
			throw new NoCoachFoundException("找不到该教练");
		}else {			
			return userCoach;
		}
	}

	@Override
	public int updateCoach(Integer coachId, String coachName, Integer coachAge,
			String coachGender, String coachBirthday, String coachAddress,
			String coachContact, String coachIcard, String coachWechat,
			String beginTime) {
		UserCoach userCoach=new UserCoach(coachId, coachName, coachAge, coachGender, coachBirthday, coachAddress, coachContact, coachIcard, coachWechat, beginTime);
		int n=mapper.updateCoach(userCoach);
		return n;
	}

	@Override
	public int insertCoach(Integer coachId, String coachName, Integer coachAge,
			String coachGender, String coachBirthday, String coachAddress,
			String coachContact, String coachIcard, String coachWechat,
			String beginTime) {
		UserCoach userCoach=new UserCoach(coachId, coachName, coachAge, coachGender, coachBirthday, coachAddress, coachContact, coachIcard, coachWechat, beginTime);
		int n=mapper.insertCoach(userCoach);
		return n;
	}

}

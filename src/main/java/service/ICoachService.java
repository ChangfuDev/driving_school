package service;

import java.util.List;

import entity.UserCoach;
import service.ex.NoCoachFoundException;

public interface ICoachService {
	public List<UserCoach> getCoaches();
	UserCoach getCoachById(Integer coachId) throws NoCoachFoundException;
	int updateCoach(Integer coachId, String coachName, Integer coachAge, String coachGender, String coachBirthday,String coachAddress, String coachContact, String coachIcard, String coachWechat, String beginTime);
	int insertCoach(Integer coachId, String coachName, Integer coachAge, String coachGender, String coachBirthday,String coachAddress, String coachContact, String coachIcard, String coachWechat, String beginTime);
}

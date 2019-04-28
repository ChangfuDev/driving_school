package service;

import java.util.List;

import entity.Enroll;
import entity.UserLearner;
import service.ex.NoLearnerFoundException;

public interface ILearnerService {
	List<UserLearner> getLearners();
	UserLearner getLearnerById(String learnerId) throws NoLearnerFoundException;
	int updateLearner(Integer learnerId, Integer learnStatus, String learnerName, Integer learnerAge, String learnerGender,
			String learnerBirthday, String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress, Integer presentSubject, String claimType,
			String beginDate, String finishDate);
	int insertLearner(Integer learnerId, Integer learnStatus, String learnerName, Integer learnerAge, String learnerGender,
			String learnerBirthday, String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress, Integer presentSubject, String claimType,
			String beginDate, String finishDate);
	List<Enroll> getAllEnroll();
}

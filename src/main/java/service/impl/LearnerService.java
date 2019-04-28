package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Enroll;
import entity.UserLearner;
import mapper.UserLearnerMapper;
import service.ILearnerService;
import service.ex.NoLearnerFoundException;

@Service
public class LearnerService implements ILearnerService {

	@Resource
	UserLearnerMapper userLearnerMapper;
	
	@Override
	public List<UserLearner> getLearners() {
		List<UserLearner> list=userLearnerMapper.getLearners();
		return list;
	}

	@Override
	public UserLearner getLearnerById(String learnerId)
			throws NoLearnerFoundException {
		UserLearner userLearner=userLearnerMapper.getLearnerById(learnerId);
		if(userLearner==null) {
			throw new NoLearnerFoundException("没有该编号的学员");
		}
		return userLearner;
	}

	@Override
	public int updateLearner(Integer learnerId, Integer learnStatus, String learnerName,
			Integer learnerAge, String learnerGender, String learnerBirthday,
			String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress,
			Integer presentSubject, String claimType, String beginDate,
			String finishDate) {
		UserLearner userLearner=new UserLearner(learnerId, learnStatus, learnerName, learnerAge, learnerGender, learnerBirthday, learnerContact, learnerEmail, learnerIcard, learnerWechat, learnerQq, learnerAddress, presentSubject, claimType, beginDate, finishDate);
		int n=userLearnerMapper.updateLearner(userLearner);
		return n;
	}

	@Override
	public int insertLearner(Integer learnerId, Integer learnStatus, String learnerName,
			Integer learnerAge, String learnerGender, String learnerBirthday,
			String learnerContact, String learnerEmail, String learnerIcard,
			String learnerWechat, String learnerQq, String learnerAddress,
			Integer presentSubject, String claimType, String beginDate,
			String finishDate) {
		UserLearner userLearner=new UserLearner(learnerId, learnStatus, learnerName, learnerAge, learnerGender, learnerBirthday, learnerContact, learnerEmail, learnerIcard, learnerWechat, learnerQq, learnerAddress, presentSubject, claimType, beginDate, finishDate);
		int n=userLearnerMapper.insertLearner(userLearner);
		return n;
	}

	@Override
	public List<Enroll> getAllEnroll() {
		List<Enroll> list=userLearnerMapper.getAllEnroll();
		return list;
	}

}

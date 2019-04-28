package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Car;
import entity.CarReservation;
import entity.UseCar;
import mapper.CarManageMapper;
import mapper.UseCarMapper;
import service.ICarReservationService;
import service.ex.NoCarReservationFoundException;
import service.ex.ReservationFullException;

@Service
public class CarReservationService implements ICarReservationService {

	@Resource
	CarManageMapper carManageMapper;
	
	@Resource
	UseCarMapper useCarMapper;
	
	@Override
	public List<CarReservation> getCarReservation() {
		List<CarReservation> list=carManageMapper.getCarReservation();
		return list;
	}

	@Override
	public void checkReser(Integer reserId) throws ReservationFullException {
		int n=carManageMapper.getCarReserNumsById(reserId);
		if(n==5) {
			throw new ReservationFullException("该教练学员已达到5位,暂时不能通过审核");
		}else {
			carManageMapper.updateCarReservationCheck(reserId);
			List<CarReservation> list=carManageMapper.getCarReservation();
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getReserId()==reserId) {
					List<Car> carList=carManageMapper.getCars();
					int key=carList.size()-1;
					int carSub=(int)(1+Math.random()*(key-0+1));
					Integer carId=carList.get(carSub).getCarId();
					UseCar useCar=new UseCar(0, carId, list.get(i).getCoachId(), list.get(i).getReserDate());
					useCarMapper.addNewCarUse(useCar);
				}
			}
		}
	}

	@Override
	public int addNewCarReser(Integer learnerId, Integer coachId,
			Integer reserSub, String reserDate, String reserContact,
			String reserEmail, String coachName, String learnerName,
			String reserField) {
		CarReservation carReservation=new CarReservation(0, learnerId, coachId, reserSub, reserDate, reserContact, reserEmail, coachName, learnerName, reserField, 0);
		int n=carManageMapper.addNewCarReser(carReservation);
		return n;
	}

	@Override
	public List<CarReservation> getCarReservationById(Integer coachId)
			throws NoCarReservationFoundException {
		List<CarReservation> list=carManageMapper.getCarReservationById(coachId);
		if(list.size()==0) {
			throw new NoCarReservationFoundException("没有该教练的预约记录");
		}else {
			return list;
		}
	}

	@Override
	public int deleteCarReser(Integer reserId) {
		int n=carManageMapper.deleteCarReser(reserId);
		return n;
	}

}

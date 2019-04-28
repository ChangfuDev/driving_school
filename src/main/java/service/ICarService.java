package service;

import java.util.List;

import entity.Car;
import entity.UseCar;
import service.ex.NoCarFoundException;
import service.ex.NoCarUseRecordException;

public interface ICarService {
	List<Car> searchCars(String content) throws NoCarFoundException;
	List<UseCar> getCarUseById(Integer carId) throws NoCarUseRecordException;
	Integer getCarUseNumById(Integer carId);
	entity.Car getCar(Integer carId);
	int addNewCarUse(Integer carId,Integer coachId,String useTime);
}

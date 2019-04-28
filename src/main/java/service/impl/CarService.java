package service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Car;
import entity.UseCar;
import mapper.CarManageMapper;
import mapper.UseCarMapper;
import service.ICarService;
import service.ex.NoCarFoundException;
import service.ex.NoCarUseRecordException;

@Service
public class CarService implements ICarService {

	@Resource
	CarManageMapper mapper;
	
	@Resource
	UseCarMapper useCarMapper;
	
	@Override
	public List<Car> searchCars(String content) throws NoCarFoundException {
		List<Car> list=mapper.searchCars(content);
		if(list.isEmpty()) {
			throw new NoCarFoundException("找不到有关的车辆");
		}else {
			return list;
		}
		
	}

	@Override
	public List<UseCar> getCarUseById(Integer carId) {
		List<UseCar> list=new ArrayList<>();
		list=useCarMapper.getCarUseById(carId);
		if(list.isEmpty()) {
			throw new NoCarUseRecordException("没有该车的使用记录!");
		}else {
			return list;
		}
	}

	@Override
	public Integer getCarUseNumById(Integer carId) {
		int n=useCarMapper.getCarUseNumById(carId);
		return n;
	}

	@Override
	public Car getCar(Integer carId) {
		Car car=mapper.getCar(carId);
		return car;
	}

	@Override
	public int addNewCarUse(Integer carId, Integer coachId, String useTime) {
		int n;
		UseCar useCar=new UseCar(0, carId, coachId, useTime, null);
		n=useCarMapper.addNewCarUse(useCar);
		return n;
	}
	
	

}

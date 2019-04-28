package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Car;
import entity.CarReservation;
import entity.RepairOrder;
import entity.UseCar;
import service.ICarReservationService;
import service.ICarService;
import service.IRepairOrderService;
import service.ex.NoCarUseRecordException;
import service.ex.NoRepairOrderFoundException;

@RequestMapping("/cars")
@Controller
public class CarsController {

	@Resource
	ICarService carService;
	
	@Resource
	IRepairOrderService repairOrderService;
	
	@Resource
	ICarReservationService carReservationService;
	
	@RequestMapping("/searchCars.do")
	@ResponseBody
	public Result searchCars(String content) {
		List<Car> list=new ArrayList<>();
		try {
			list=carService.searchCars(content);
			return new Result(1,"ok",list);
		}catch(Exception e) {
			e.printStackTrace();
			return new Result(e);
		}
		
	}
	
	@RequestMapping("/getCarUseById.do")
	@ResponseBody
	public Result getCarUseById(Integer carId) {
		try {
			List<UseCar> list;
			list=carService.getCarUseById(carId);
			int n=list.size();
			return new Result(1,"共有"+n+"条使用记录",list);
		}catch (NoCarUseRecordException e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/getCarUseNumById.do")
	@ResponseBody
	public Result getCarUseNumById(Integer carId) {
		return new Result(carService.getCarUseNumById(carId)+"");
	}
	
	@RequestMapping("/getCar.do")
	@ResponseBody
	public Result getCar(Integer carId) {
		return new Result(carService.getCar(carId));
	}
	
	@RequestMapping("/getRepairOrderById.do")
	@ResponseBody
	public Result getRepairOrderById(Integer carId) {
		try {
			List<RepairOrder> list=repairOrderService.getRepairOrderById(carId);
			int n=repairOrderService.getRepairOrderNumById(carId);
			return new Result(1,"该车共有"+n+"笔维修单",list);
		}catch(NoRepairOrderFoundException e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/addNewCarUse.do")
	@ResponseBody
	public Result addNewCarUse(Integer carId, Integer coachId, String useTime) {
		int n=carService.addNewCarUse(carId, coachId, useTime);
		if(n==1) {
			return new Result(1,"",null);
		}else {
			return new Result(0,"保存失败",null);
		}
	}
	
	@RequestMapping("/addNewRepairOrder.do")
	@ResponseBody
	public Result addNewRepairOrder(Integer carId,Integer devId,String repName,String repLocation,String repTime) {
		try {
			repLocation = new String(repLocation.getBytes("ISO-8859-1"), "utf-8");
			repName = new String(repName.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(repLocation);
		int n=repairOrderService.addNewRepairOrder(carId, devId, repName, repLocation, repTime);
		if(n==1) {
			return new Result(1,"",null);
		}else {
			return new Result(0,"保存失败",null);
		}
	}
	
	@RequestMapping("/getCarReservation.do")
	@ResponseBody
	public Result getCarReservation() {
		List<CarReservation> list=carReservationService.getCarReservation();
		return new Result(list);
	}
	
	
	@RequestMapping("/checkReser.do")
	@ResponseBody
	public Result checkReser(Integer reserId) {
		try {
			carReservationService.checkReser(reserId);
			return new Result(1,"OK",null);
		}catch(Exception e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/addNewCarReser.do")
	@ResponseBody
	public Result addNewCarReser(Integer learnerId, Integer coachId, Integer reserSub,String reserDate, String reserContact, String reserEmail,String coachName, String learnerName, String reserField) {
		int n=carReservationService.addNewCarReser(learnerId, coachId, reserSub, reserDate, reserContact, reserEmail, coachName, learnerName, reserField);
		if(n==0) {
			return new Result(0,"添加失败",null);
		}else {
			return new Result("添加成功");
		}
	}
	
	@RequestMapping("/getCarReservationById.do")
	@ResponseBody
	public Result getCarReservationById(Integer coachId) {
		List<CarReservation> list;
		try {
			list=carReservationService.getCarReservationById(coachId);
			return new Result(list);
		}catch(Exception e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/getCarsById.do")
	@ResponseBody
	public Result getCarsById(Integer coachId) {
		return null;
	}
	
	@RequestMapping("/deleteCarReser.do")
	@ResponseBody
	public Result deleteCarReser(Integer reserId) {
		int n=carReservationService.deleteCarReser(reserId);
		if(n==0) {
			return new Result(0,"删除失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
}

package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.DevFlist;
import entity.DevStore;
import entity.Device;
import service.IDevFlistService;
import service.ex.StoreNotEnoughException;
import service.impl.DeviceService;

@RequestMapping("/devices")
@Controller
public class DevicesController {

	@Resource
	DeviceService deviceService;
	
	@Resource
	IDevFlistService devFlistService;
	
	@RequestMapping("/getDevices.do")
	@ResponseBody
	public Result getDevices() {
		List<Device> list=deviceService.getDevices();
		return new Result(list);
	}
	
	@RequestMapping("/addDevicesIn.do")
	@ResponseBody
	public Result addDevicesIn(Integer devId, Float price, Integer count, String pS, String flistTime, String supplier) {
		try {
			pS=new String(pS.getBytes("ISO-8859-1"), "utf-8");
			supplier=new String(supplier.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		int n=devFlistService.addDevicesIn(devId, price, count, pS, flistTime, supplier);
		if(n==0) {
			return new Result(0,"数据库存入失败",null);
		}else {
			return new Result(1,"",null);
		}
	}
	
	@RequestMapping("/addDevicesOut.do")
	@ResponseBody
	public Result addDevicesOut(Integer devId, Float price, Integer count, String pS, String flistTime, String supplier) {
		try {
			pS=new String(pS.getBytes("ISO-8859-1"), "utf-8");
			supplier=new String(supplier.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			int n=devFlistService.addDevicesOut(devId, price, count, pS, flistTime, supplier);
			if(n==0) {
				return new Result(0,"数据库存入失败",null);
			}else {
				return new Result(1,"",null);
			}
		}catch(StoreNotEnoughException e) {
			e.printStackTrace();
			return new Result(e);
		}
	}
	
	@RequestMapping("/getAllDevStore.do")
	@ResponseBody
	public Result getAllDevStore() {
		List<DevStore> list=deviceService.getAllDevStore();
		return new Result(list);
	}
	
	@RequestMapping("/getAllDevFlist.do")
	@ResponseBody
	public Result getAllDevFlist() {
		List<DevFlist> list=devFlistService.getAllDevFlist();
		return new Result(list);
	}
}

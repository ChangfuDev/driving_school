package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import entity.Enroll;
import mapper.UserLearnerMapper;
import service.IExcelService;
import utils.ReadExcel;

@Service
public class LoadExcelService implements IExcelService {

	@Resource
	UserLearnerMapper mapper;
	@Override
	public String readExcelFile(MultipartFile file) {
		//创建处理EXCEL的类
        ReadExcel readExcel=new ReadExcel();
        //解析excel，获取上传的事件单
        List<Enroll> enList = null;
        int insertResult = 0;
		String insertMsg = "";
		try {
			enList = readExcel.getExcelInfo(file);
			//至此已经将excel中的数据转换到list里面了,接下来就可以操作list,可以进行保存到数据库,或者其他操作,
			//和你具体业务有关,这里不做具体的示范
			//数据库插入		
			for(Enroll s :enList) {
				insertResult += mapper.insertEnroll(s);
				System.out.println(s.toString());
			}
			if(insertResult ==0) {
				insertMsg = "All insert false";
			}else if(insertResult == enList.size()){
				insertMsg = "All insert success";
			}else {
				insertMsg = "Part insert success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("接受excel表格中的数据失败！！！");
		}
		for(Enroll s : enList) {
        	System.out.println("打印excel中的数据"+s.toString());
        }
		return insertMsg;
	}
}

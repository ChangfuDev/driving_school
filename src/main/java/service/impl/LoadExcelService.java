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
		//��������EXCEL����
        ReadExcel readExcel=new ReadExcel();
        //����excel����ȡ�ϴ����¼���
        List<Enroll> enList = null;
        int insertResult = 0;
		String insertMsg = "";
		try {
			enList = readExcel.getExcelInfo(file);
			//�����Ѿ���excel�е�����ת����list������,�������Ϳ��Բ���list,���Խ��б��浽���ݿ�,������������,
			//�������ҵ���й�,���ﲻ�������ʾ��
			//���ݿ����		
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
			System.err.println("����excel����е�����ʧ�ܣ�����");
		}
		for(Enroll s : enList) {
        	System.out.println("��ӡexcel�е�����"+s.toString());
        }
		return insertMsg;
	}
}

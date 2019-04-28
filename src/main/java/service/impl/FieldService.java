package service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Field1;
import entity.Field2;
import entity.Field3;
import entity.Field4;
import mapper.FieldsMapper;
import service.IFieldService;
import service.ex.NoFieldsFoundException;

@Service
public class FieldService implements IFieldService {

	@Resource
	private FieldsMapper fieldsMapper;

	@Override
	public List<Integer> getFieldsStatus() {
		List<Integer> list = new ArrayList<Integer>();
		Integer i1, i2, i3, i4;
		i1 = fieldsMapper.getField1Status();
		i2 = fieldsMapper.getField2Status();
		i3 = fieldsMapper.getField3Status();
		i4 = fieldsMapper.getField4Status();
		list.add(i1);
		list.add(i2);
		list.add(i3);
		list.add(i4);
		return list;
	}

	@Override
	public List<Field1> getField1Detail() {
		List<Field1> list = new ArrayList<>();
		list = fieldsMapper.getField1Detail();
		if (!list.isEmpty()) {
			return list;
		}else {
			throw new NoFieldsFoundException("no data!!!");
		}
	}

	@Override
	public List<Field2> getField2Detail() {
		List<Field2> list = new ArrayList<>();
		list = fieldsMapper.getField2Detail();
		if (!list.isEmpty()) {
			return list;
		}else {
			throw new NoFieldsFoundException("no data!!!");
		}
	}

	@Override
	public List<Field3> getField3Detail() {
		List<Field3> list = new ArrayList<>();
		list = fieldsMapper.getField3Detail();
			return list;
	}

	@Override
	public List<Field4> getField4Detail() {
		List<Field4> list = new ArrayList<>();
		list = fieldsMapper.getField4Detail();
		if (!list.isEmpty()) {
			return list;
		}else {
			throw new NoFieldsFoundException("no data!!!");
		}
	}

	@Override
	public int changeField1(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime) {
		Field1 field1=new Field1(fieldId,fieldStatus,coachId,startTime,finishTime);
		int n=fieldsMapper.changeField1(field1);
		return n;
	}

	@Override
	public int changeField2(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime) {
		Field2 field2=new Field2(fieldId,fieldStatus,coachId,startTime,finishTime);
		int n=fieldsMapper.changeField2(field2);
		return n;
	}

	@Override
	public int changeField3(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime) {
		Field3 field3=new Field3(fieldId,fieldStatus+"",coachId,startTime,finishTime);
		int n=fieldsMapper.changeField3(field3);
		return n;
	}

	@Override
	public int changeField4(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime) {
		Field4 field4=new Field4(fieldId,fieldStatus,coachId,startTime,finishTime);
		int n=fieldsMapper.changeField4(field4);
		return n;
	}

	@Override
	public int addField3(String fieldStatus, int coachId, String startTime,
			String finishTime) {
		Field3 field3=new Field3(null, fieldStatus, coachId, startTime, finishTime);
		return fieldsMapper.addField3(field3);
	}

	@Override
	public int deleteField3(Integer fieldId) {
		int n=fieldsMapper.deleteField3(fieldId);
		return n;
	}

	@Override
	public List<String> getAllFieldId() {
		List<Field1> field1s=fieldsMapper.getField1Detail();
		List<Field2> field2s=fieldsMapper.getField2Detail();
		List<Field3> field3s=fieldsMapper.getField3Detail();
		List<Field4> field4s=fieldsMapper.getField4Detail();
		List<String> list=new ArrayList<>();
		for(int i=0;i<field1s.size();i++) {
			list.add(field1s.get(i).getFieldId());
		}
		for(int i=0;i<field2s.size();i++) {
			list.add(field2s.get(i).getFieldId());
		}
		for(int i=0;i<field3s.size();i++) {
			list.add(field3s.get(i).getFieldId());
		}
		for(int i=0;i<field4s.size();i++) {
			list.add(field4s.get(i).getFieldId());
		}
		return list;
	}

}

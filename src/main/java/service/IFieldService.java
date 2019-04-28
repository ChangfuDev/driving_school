package service;

import java.util.List;

import entity.Field1;
import entity.Field2;
import entity.Field3;
import entity.Field4;
import service.ex.NoFieldsFoundException;

public interface IFieldService {
	List<Integer> getFieldsStatus();
	List<Field1> getField1Detail() throws NoFieldsFoundException;
	List<Field2> getField2Detail() throws NoFieldsFoundException;
	List<Field3> getField3Detail();
	List<Field4> getField4Detail() throws NoFieldsFoundException;
	int changeField1(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime);
	int changeField2(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime);
	int changeField3(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime);
	int changeField4(String fieldId,int fieldStatus,int coachId,String startTime,String finishTime);
	int addField3(String fieldStatus,int coachId,String startTime,String finishTime);
	int deleteField3(Integer fieldId);
	List<String> getAllFieldId();
}

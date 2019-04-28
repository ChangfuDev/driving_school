package mapper;

import java.util.List;

import entity.Field1;
import entity.Field2;
import entity.Field3;
import entity.Field4;

public interface FieldsMapper {
	int getField1Status();

	int getField2Status();

	int getField3Status();

	int getField4Status();

	List<Field1> getField1Detail();
	List<Field2> getField2Detail();
	List<Field3> getField3Detail();
	List<Field4> getField4Detail();
	int changeField1(Field1 field1);
	int changeField2(Field2 field2);
	int changeField3(Field3 field3);
	int changeField4(Field4 field4);
	int addField3(Field3 field3);
	int deleteField3(Integer fieldId);
}

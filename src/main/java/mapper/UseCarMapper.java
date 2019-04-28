package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.UseCar;

public interface UseCarMapper {
	List<UseCar> getCarUseById(@Param("carId") Integer carId);
	int getCarUseNumById(@Param("carId") Integer carId);
	int addNewCarUse(UseCar useCar);
}

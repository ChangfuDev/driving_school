package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Car;
import entity.CarReservation;

public interface CarManageMapper {
	List<Car> searchCars(@Param("content") String content);
	Car getCar(@Param("carId") Integer carId);
	List<CarReservation> getCarReservation();
	int updateCarReservationCheck(Integer reserId);
	int getCarReserNumsById(Integer reserId);
	int addNewCarReser(CarReservation carReservation);
	List<CarReservation> getCarReservationById(@Param("coachId") Integer coachId);
	List<Car> getCarsById(@Param("coachId") Integer coachId);
	List<Car> getCars();
	int deleteCarReser(Integer reserId);
}

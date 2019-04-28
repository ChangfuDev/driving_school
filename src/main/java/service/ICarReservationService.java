package service;

import java.util.List;

import entity.CarReservation;
import service.ex.NoCarReservationFoundException;
import service.ex.ReservationFullException;

public interface ICarReservationService {
	List<CarReservation> getCarReservation();
	void checkReser(Integer reserId) throws ReservationFullException;
	int addNewCarReser(Integer learnerId, Integer coachId, Integer reserSub,String reserDate, String reserContact, String reserEmail,String coachName, String learnerName, String reserField);
	List<CarReservation> getCarReservationById(Integer coachId) throws NoCarReservationFoundException;
	int deleteCarReser(Integer reserId);
}

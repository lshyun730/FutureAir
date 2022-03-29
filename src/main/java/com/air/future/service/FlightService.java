package com.air.future.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.air.future.dao.FlightDAO;
import com.air.future.vo.Customer;
import com.air.future.vo.Reservation;
import com.air.future.vo.Schedule;

@Service
public class FlightService {
	
	@Autowired
	FlightDAO dao;

	public ArrayList<ArrayList<HashMap<String, String>>> getFlightList (HashMap<String, String> bookForm)  {
		
		HashMap<String, String> bookSearch =  new HashMap<String, String>(bookForm);
		ArrayList<ArrayList<HashMap<String, String>>> flightListType = new ArrayList<>();
		String trip_type = bookSearch.get("trip_type");
		String[] date = null;

		if(!bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("pick_date_list").split(" ~ ");
		if(bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("departure_date").split(" ~ ");
		
		for (int i = 0; i < date.length; i++) {
		    bookSearch.put("departure_date", date[i]);
		    if(i == 1 && trip_type.equals("왕복")) {
		        String departure_name = bookSearch.get("departure_name");
		        bookSearch.put("departure_name", bookSearch.get("arrival_name"));
		        bookSearch.put("arrival_name", departure_name);
		    }
		    flightListType.add(dao.getFlightList(bookSearch));
		}
		return flightListType;
	}
	
	public ArrayList<ArrayList<HashMap<String, String>>> getWeekInfo(HashMap<String, String> bookForm) {

		ArrayList<ArrayList<HashMap<String, String>>> weekInfo = new ArrayList<>();
		
		HashMap<String, String> bookSearch =  new HashMap<String, String>(bookForm);
		String trip_type = bookSearch.get("trip_type");
		String[] date = null;
		
		System.out.println(bookForm);

		if(!bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("pick_date_list").split(" ~ ");
		if(bookSearch.get("pick_date_list").equals("")) date = bookSearch.get("departure_date").split(" ~ ");
		
		for (int i = 0; i < date.length; i++) {
			bookSearch.put("pick_date", date[i]);
			if(i == 1 && trip_type.equals("왕복")) {
				String departure_name = bookSearch.get("departure_name");
				bookSearch.put("departure_name", bookSearch.get("arrival_name"));
				bookSearch.put("arrival_name", departure_name);
			}
			weekInfo.add(dao.getWeekInfo(bookSearch));
		}
		return weekInfo;
	
	}
	
	public ArrayList<HashMap<String, String>> getRoute(HashMap<String, String> bookForm) {
		ArrayList<HashMap<String, String>> flightList = new ArrayList<>();
		System.out.println(bookForm.get("route_num[]"));
		String[] route_num_list = bookForm.get("route_num[]").split(",");
		for (int i = 0; i < route_num_list.length; i++) {
			HashMap<String, String> flight = dao.getRoute(route_num_list[i]);
			flight.put("SEAT_CLASS", bookForm.get("seat_class" + (i + 1)));
			flightList.add(flight);
		}
		return flightList;
	}

	public Customer getCustomerInfo(String userInfo) {
		Customer customer = dao.getCustomerInfo(userInfo);
		return customer;
	}

	public HashMap<String, String> customerTypeList(HashMap<String, String> bookForm) {
		System.out.println(bookForm);
		return bookForm;
	}

	// 예약번호 생성
	public String getReservationNum() {
		String reservationNum = dao.getReservationNum();
		return reservationNum;
	}

	public int insertReservation(String reservationNum, HashMap<String, String> bookForm) {
		Reservation reservation = new Reservation();
		String[] route = bookForm.get("route_num_list").split(",");
		String[] seatClass = bookForm.get("seat_class_list").split(",");
 		ArrayList<Schedule> scheduleList = new ArrayList<>();
		
		System.out.println(bookForm);
		
		// set reservation
		reservation.setReservation_num(reservationNum);
		reservation.setCustomer_id(bookForm.get("customer_id"));
		reservation.setReservation_state("예약완료");
		reservation.setPayment(Integer.parseInt(bookForm.get("payment")));
		
		System.out.println(reservation);
	
		// set schedule
		for (int i = 0; i< route.length; i++) {
			for (int j = 1; j <= Integer.parseInt(bookForm.get("passenger_count")); j++) {
				Schedule schedule = new Schedule();
				schedule.setReservation_num(reservationNum);
				schedule.setPassport_num(bookForm.get("passport"+ j));
				schedule.setPassenger_name(bookForm.get("name"+ j) );
				schedule.setPassenger_birth(bookForm.get("birth"+ j));
				schedule.setPassenger_gender(bookForm.get("gender"+ j));
				schedule.setCustomer_type(bookForm.get("type"+ j));
				schedule.setSeat_class(seatClass[i]);
				schedule.setRoute_num(route[i]);
				schedule.setType("여정" + (i + 1));
				if(j==1) {
					schedule.setCustomer_id(bookForm.get("customer_id"));
				} else {
					schedule.setCustomer_id("");					
				}
				
				System.out.println(schedule);
				scheduleList.add(schedule);
			}
		}
		
		
		int result = dao.insertReservation(reservation, scheduleList, bookForm.get("customer_id"));
		
		return 0;
	}
}

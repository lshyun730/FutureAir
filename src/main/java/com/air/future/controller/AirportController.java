package com.air.future.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "airport")
@Controller
public class AirportController {

	// 수하물안내
	@RequestMapping(value = "baggage/baggageInfo", method = RequestMethod.GET)
	public String baggageInfo( ) {
		return "airport/baggageInfo";
	}
	
	// 운송제한물품
	@RequestMapping(value = "baggage/baggageRestricted", method = RequestMethod.GET)
	public String baggageRestricted( ) {
		return "airport/baggageRestricted";
	}
	
	// 휴대수하물
	@RequestMapping(value = "baggage/baggageCarryOn", method = RequestMethod.GET)
	public String baggageCarryOn( ) {
		return "airport/baggageCarryOn";
	}
	
	// 위탁수하물
	@RequestMapping(value = "baggage/baggageChecked", method = RequestMethod.GET)
	public String baggageChecked( ) {
		return "airport/baggageChecked";
	}
		
}

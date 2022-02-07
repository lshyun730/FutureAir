package com.air.future.vo;

import lombok.Data;

@Data
public class Grade {
	private int customer_grade_index;
	private String grade;			    
	private int mileage_scope;	    
	private int mileage_ratio;	    
	private int mileage_exp;		
	private int pay_scope;		    
	private int pay_ratio;		    
	private int promo_terms;
	private int the_count;
}

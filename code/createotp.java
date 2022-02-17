package com.model;

import java.util.Random;

public class createotp {

	public String createotpmethod() {
		 Random r = new Random();
	     int ii = r.nextInt(10000000-500000)+500000;
	     String k = ii+"";
	     String l = "1";
	     System.out.println(k);
	     return k;
	}

}

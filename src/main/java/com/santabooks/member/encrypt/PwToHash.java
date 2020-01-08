package com.santabooks.member.encrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwToHash {

	  public static String toHash(String origin) {
	        MessageDigest md;
	      try {
	         md = MessageDigest.getInstance("SHA-256");
	         md.update(origin.getBytes());

	         StringBuilder builder = new StringBuilder();
	         for (byte b: md.digest()) 
	           builder.append(String.format("%02x", b));
	         
	         return builder.toString();
	      } catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
	      
	      return "";
	   }

}
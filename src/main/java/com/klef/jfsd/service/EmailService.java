package com.klef.jfsd.service;


public interface EmailService 
{
  public void sendEmail(String toemail, String subject, String message);
}

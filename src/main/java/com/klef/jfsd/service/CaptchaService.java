package com.klef.jfsd.service;

public interface CaptchaService 
{

	public byte[] generateCaptcha(int captchaLength);

	public String generateText(int captchaLength);

	public boolean validateCaptcha(String input);

}

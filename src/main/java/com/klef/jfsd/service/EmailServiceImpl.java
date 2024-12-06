package com.klef.jfsd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService
{
	@Autowired
    private JavaMailSender mailSender;
		
	 public void sendEmail(String to, String subject, String htmlContent) {
	        MimeMessage message = mailSender.createMimeMessage();

	        try {
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(htmlContent, true); 
	            mailSender.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            throw new RuntimeException("Error sending email: " + e.getMessage());
	        }
	    }
}

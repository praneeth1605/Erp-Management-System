package com.klef.jfsd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BaseController 
{
	
	@Autowired
	EmailService emailService;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView defaultlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/student/login");
		return mv;
	}
	
	
	
	
	
}
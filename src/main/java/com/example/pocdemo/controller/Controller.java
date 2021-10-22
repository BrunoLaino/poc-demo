package com.example.pocdemo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping()
public class Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller.class);
	
	@GetMapping("/ola")
	public String ola() {
		logger.info("Log: Antes da execução");
		String ola = "ola";
		logger.info("Log: Depois da execução, Var = " + ola);
		return(ola);
	}
}

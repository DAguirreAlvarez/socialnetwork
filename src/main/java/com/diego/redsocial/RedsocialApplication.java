package com.diego.redsocial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.diego.redsocial.services.RoleService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.diego.redsocial.controllers", "com.diego.redsocial.services", "com.diego.redsocial.repositories", "com.diego.redsocial.models"})
public class RedsocialApplication implements CommandLineRunner{

	public static void main(String[] args) {
		SpringApplication.run(RedsocialApplication.class, args);
	}
	
	@Autowired
	private RoleService rolServ;
	
	public void run(String... args) throws Exception {
		rolServ.rolesIniciales();
    }

}

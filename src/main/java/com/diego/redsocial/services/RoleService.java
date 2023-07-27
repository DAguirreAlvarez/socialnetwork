package com.diego.redsocial.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diego.redsocial.models.Role;
import com.diego.redsocial.repositories.RoleRepository;

@Service
public class RoleService {

	
	@Autowired
	private RoleRepository roleRepo;
	
	
	
	public void rolesIniciales() {
		if(roleRepo.findByName("usuario")==null) {
			Role usuario = new Role();
			usuario.setName("usuario");
			roleRepo.save(usuario);
			
		}
		if(roleRepo.findByName("admin")==null) {
			Role admin = new Role();
			admin.setName("admin");			
			roleRepo.save(admin);
		}		
	}
	
	
}

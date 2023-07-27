package com.diego.redsocial.services;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.diego.redsocial.models.Role;
import com.diego.redsocial.models.User;
import com.diego.redsocial.repositories.RoleRepository;
import com.diego.redsocial.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RoleRepository roleRepo;

	
	
	
	public List<User> listarUsuarios(){
		return userRepo.findAll();
	}
	
	public User findByEmail(String email){
		return userRepo.findByEmail(email);
	}
	
	public User findById(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
	public User crearUsuario(User user, BindingResult r) {
		if(findByEmail(user.getEmail())==null) {
			if(user.getPassword().equals(user.getPasswordConfirmation())) {
				String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
				user.setPassword(hashed);
				Role normal = roleRepo.findByName("usuario");
				List<Role> roles = new ArrayList<Role>();
				roles.add(normal);
				user.setRoles(roles);
				userRepo.save(user);
				return user;
			}else {
				r.rejectValue("passwordConfirmation", "no-match", "Ambas passwords deben coincidir.");
				return null;
			}
		}else {
			r.rejectValue("email", "Matches", "El email ingresado ya existe");
			return null;
		}
	}
	
	public boolean autenticacion(String email, String password, BindingResult result) {
		User usuario = userRepo.findByEmail(email);
		if(usuario==null) {
			result.rejectValue("email", "Matches","Email no existe.");
			return false;
		}else {
			if(BCrypt.checkpw(password, usuario.getPassword())) {
				return true;
			}else {
				result.rejectValue("password", "Matches", "Password no valida");
				return false;
			}
		}
	}
	
}

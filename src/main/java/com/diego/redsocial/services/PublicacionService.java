package com.diego.redsocial.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diego.redsocial.models.Publicacion;
import com.diego.redsocial.repositories.PublicacionRepository;

@Service
public class PublicacionService {

	@Autowired
	private PublicacionRepository puRepo;
	
	public void crearPost(Publicacion post) {
		puRepo.save(post);
	}
	
	
	public List<Publicacion> listarPublicaciones(){
		return puRepo.findAllByOrderByIdDesc();
	}
	
	public boolean borrarPublicacion(Long id) {
		if(puRepo.findById(id)==null) {
			return false;
		}else {
			Publicacion p = puRepo.findById(id).orElse(null);
			puRepo.delete(p);
			return true;
		}
	}
	
	public List<Publicacion> postUser(Long id){
		return puRepo.findByAuthorId(id);
	}
	
	public Publicacion postById(Long id) {
		return puRepo.findById(id).orElse(null);
	}
	
	
	
	
}

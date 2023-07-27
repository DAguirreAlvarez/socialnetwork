package com.diego.redsocial.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diego.redsocial.models.Comentario;
import com.diego.redsocial.repositories.ComentarioRepository;

@Service
public class ComentarioService {
	
	@Autowired
	private ComentarioRepository comRepo;
	
	public List<Comentario> comentariosPubli(Long id){
		return comRepo.findAllByPostId(id);
	}
	
	public void comentar(Comentario com) {
		comRepo.save(com);
	}
}

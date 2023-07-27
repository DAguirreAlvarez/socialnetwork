package com.diego.redsocial.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.diego.redsocial.models.Comentario;

@Repository
public interface ComentarioRepository extends CrudRepository<Comentario, Long>{
	
	List<Comentario> findAllByPostId(Long id);
}

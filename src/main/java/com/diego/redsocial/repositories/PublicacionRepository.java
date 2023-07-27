package com.diego.redsocial.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.diego.redsocial.models.Publicacion;

@Repository
public interface PublicacionRepository extends CrudRepository<Publicacion, Long>{
	List<Publicacion> findAll();
	
	List<Publicacion> findByAuthorId(Long id);
}

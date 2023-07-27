package com.diego.redsocial.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.diego.redsocial.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long>{
	Role findByName(String name);
	
	List<Role> findAll();
}

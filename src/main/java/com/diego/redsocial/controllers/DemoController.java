package com.diego.redsocial.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.diego.redsocial.models.Comentario;
import com.diego.redsocial.models.LoginUser;
import com.diego.redsocial.models.Publicacion;
import com.diego.redsocial.models.User;
import com.diego.redsocial.services.ComentarioService;
import com.diego.redsocial.services.PublicacionService;
import com.diego.redsocial.services.RoleService;
import com.diego.redsocial.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class DemoController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private RoleService roleServ;
	
	@Autowired
	private PublicacionService puServ;
	
	@Autowired
	private ComentarioService coServ;
	
	
	@GetMapping("/")
	public String index(Model modelo, HttpSession sesion){
		sesion.setAttribute("id", null);
		modelo.addAttribute("user", new User());
		modelo.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user")User usuario, BindingResult result,Model modelo) {
		if(result.hasErrors()) {
			modelo.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		User usuarioRegistrado = userServ.crearUsuario(usuario, result);
		if(usuarioRegistrado!= null) {
			modelo.addAttribute("successRegister", "Registro existoso");
			modelo.addAttribute("user", new User());
			modelo.addAttribute("loginUser", new LoginUser());
			modelo.addAttribute("clases", "text-light bg-success rounded p-2 text-center border mt-2");
			return "index.jsp";
		}
		modelo.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser")LoginUser loginUser, BindingResult result, Model modelo,
			HttpSession sesion) {
		if(result.hasErrors()) {
			modelo.addAttribute("user", new User());
			return "index.jsp";
		}
		if(userServ.autenticacion(loginUser.getEmail(), loginUser.getPassword(), result)) {
			sesion.setAttribute("id", userServ.findByEmail(loginUser.getEmail()).getId());
			
			return "redirect:/home";
		}else {
			modelo.addAttribute("user", new User());
			return "index.jsp";
		}
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession sesion) {
		sesion.setAttribute("id", null);
		return "redirect:/";
	}
	
	@GetMapping("/home")
	public String home(Model modelo, HttpSession sesion) {
		if(sesion.getAttribute("id")== null) {
			return "redirect:/";
		}
		
		modelo.addAttribute("user", userServ.findById((Long) sesion.getAttribute("id")));
		modelo.addAttribute("posts", puServ.listarPublicaciones());
		//modelo.addAttribute("posts", puServ.postUser((Long) sesion.getAttribute("id")));
		modelo.addAttribute("post", new Publicacion());
		return "home.jsp";
	}
	
	
	@PostMapping("/post/new")
	public String savePost(@Valid @ModelAttribute("post")Publicacion publicacion, BindingResult result, HttpSession
			sesion, Model modelo) {
		if(sesion.getAttribute("id")==null) {
			return "redirect:/";
		}
		if(result.hasErrors()) {
			modelo.addAttribute("user", userServ.findById((Long) sesion.getAttribute("id")));
			modelo.addAttribute("posts", puServ.listarPublicaciones());
			modelo.addAttribute("claseError", "mb-2 bg-danger border rounded d-inline-block p-2");
			return "home.jsp";
		}
		publicacion.setAuthor(userServ.findById((Long) sesion.getAttribute("id")));
		puServ.crearPost(publicacion);
		return "redirect:/home";
	}
	
	
	
	@DeleteMapping("/post/delete/{id}")
	public String deletePost(@PathVariable("id")Long id, HttpSession sesion) {
		if(sesion.getAttribute("id")== null) {
			return "redirect:/";
		}
		if(sesion.getAttribute("id")!=puServ.postById(id)) {
			return "redirect:/home";
		}
		puServ.borrarPublicacion(id);
		return "redirect:/home";
	}
	
	
	@GetMapping("/post/{id}")
	public String post(@PathVariable("id")Long id, Model modelo, HttpSession sesion) {
		if(sesion.getAttribute("id")== null) {
			return "redirect:/";
		}
		modelo.addAttribute("user", userServ.findById((Long) sesion.getAttribute("id")));
		modelo.addAttribute("post", puServ.postById(id));
		modelo.addAttribute("comentarios", coServ.comentariosPubli(id));
		modelo.addAttribute("comentario", new Comentario());
		return "post.jsp";
	}
	
	@PostMapping("/post/{id}")
	public String postComment(@PathVariable("id")Long id, Model modelo,@Valid @ModelAttribute("comentario")Comentario com ,BindingResult result, HttpSession sesion) {
		if(result.hasErrors()) {
			modelo.addAttribute("user", userServ.findById((Long) sesion.getAttribute("id")));
			modelo.addAttribute("post", puServ.postById(id));
			modelo.addAttribute("comentarios", coServ.comentariosPubli(id));
			modelo.addAttribute("claseError", "mb-2 bg-danger border rounded d-inline-block p-2");
			return "post.jsp";
		}
		if(sesion.getAttribute("id")== null) {
			return "redirect:/";
		}
		
		
		com.setPost(puServ.postById(id));
		com.setAuthor(userServ.findById((Long) sesion.getAttribute("id")));
		coServ.comentar(com);
		
		return "redirect:/post/"+id;
	}
	
	@GetMapping("/profile/{id}")
	public String perfil(@PathVariable("id")Long id ,Model modelo, HttpSession sesion) {
		modelo.addAttribute("publicaciones", puServ.postUser(id));
		modelo.addAttribute("user", userServ.findById((Long) id));
		return "profile.jsp";
		
	}
	
	
	
	
	
}

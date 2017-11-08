package com.example.springtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class MainController {

	@Autowired
	private TopicRepo topicRepo;

	@GetMapping(value = "/index")
	public String index(ModelMap model) {
		return "index";
	}

	@GetMapping(value = "/init")
	public @ResponseBody Iterable<TopicEntity> init() {
		return topicRepo.findAll();
	}

	@PostMapping(value = "/del")
	public @ResponseBody void del(TopicEntity entity) {
		topicRepo.delete(entity);
	}

	@PostMapping(value = "/upd")
	public @ResponseBody void upd(TopicEntity entity) {
		topicRepo.save(entity);
	}

}
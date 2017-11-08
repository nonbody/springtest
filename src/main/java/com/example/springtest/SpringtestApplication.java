package com.example.springtest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringtestApplication {

	private static final Logger log = LoggerFactory.getLogger(SpringtestApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(SpringtestApplication.class, args);
	}

	@Bean
	public CommandLineRunner demo(TopicRepo topicRepo) {
		return (args) -> {

			topicRepo.save(new TopicEntity("Jellopy"));
			topicRepo.save(new TopicEntity("Fluff"));
			topicRepo.save(new TopicEntity("Poring"));
			topicRepo.save(new TopicEntity("Lunatic"));

			log.info("findAll():"DSSS);
			log.info("-------------------------------");
			for (TopicEntity topic : topicRepo.findAll()) {
				log.info(topic.toString());
			}

		};
	}

	// @Bean
	// public CommandLineRunner demo(CustomerRepository repository) {
	// return (args) -> {
	// // save a couple of customers
	// repository.save(new Customer("Jack", "Bauer"));
	// repository.save(new Customer("Chloe", "O'Brian"));
	// repository.save(new Customer("Kim", "Bauer"));
	// repository.save(new Customer("David", "Palmer"));
	// repository.save(new Customer("Michelle", "Dessler"));
	//
	// // fetch all customers
	// log.info("Customers found with findAll():");
	// log.info("-------------------------------");
	// for (Customer customer : repository.findAll()) {
	// log.info(customer.toString());
	// }
	// log.info("");
	//
	// // fetch an individual customer by ID
	// Customer customer = repository.findOne(1L);
	// log.info("Customer found with findOne(1L):");
	// log.info("--------------------------------");
	// log.info(customer.toString());
	// log.info("");
	//
	// // fetch customers by last name
	// log.info("Customer found with findByLastName('Bauer'):");
	// log.info("--------------------------------------------");
	// for (Customer bauer : repository.findByLastName("Bauer")) {
	// log.info(bauer.toString());
	// }
	// log.info("");
	// };
	// }

}

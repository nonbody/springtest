package com.example.springtest;

import org.springframework.data.repository.CrudRepository;

public interface TopicRepo extends CrudRepository<TopicEntity, Long> {

//	@Query(value = "SELECT t.*,(select count(1) from COMMENT m where m.topic_pk = t.pk ) as commentscount FROM TOPIC t", nativeQuery = true)
//	List<Object[]> findAllAndCountComments();
	
}

package com.example.springtest;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TopicEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long pk;
	private String topic_name;

	public TopicEntity() {
		super();
	}

	public TopicEntity(String topic_name) {
		super();
		this.topic_name = topic_name;
	}

	public void setPk(Long pk) {
		this.pk = pk;
	}

	public Long getPk() {
		return pk;
	}

	public String getTopic_name() {
		return topic_name;
	}

	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}

	@Override
	public String toString() {
		return "TopicEntity [pk=" + pk + ", topic_name=" + topic_name + "]";
	}

}
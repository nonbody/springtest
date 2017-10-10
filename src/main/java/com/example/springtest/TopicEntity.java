package com.example.springtest;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TOPIC")
public class TopicEntity {

	@Id
	private Long pk;
	private String topic_name;

	public Long getPk() {
		return pk;
	}

	public void setPk(Long pk) {
		this.pk = pk;
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

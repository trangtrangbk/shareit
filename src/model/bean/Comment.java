package model.bean;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private String email;
	private String content;
	private boolean state;
	private News news;
	private Timestamp date_create;
	public Timestamp getDate_create() {		
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}

	public Comment(int id, String email, String content, boolean state, News news, Timestamp date_create) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
		this.state = state;
		this.news = news;
		this.date_create = date_create;
	}
	public Comment() {
		super();
	}
	
}

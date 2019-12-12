package model.bean;

import java.sql.Timestamp;

public class News {
	private int id;
	private String name;
	private String preview_text;
	private String detail_text;
	private Timestamp date_create;
	private String picture;
	private int counter;
	private Category cat;
	private User user;
	private boolean state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreview_text() {
		return preview_text;
	}
	public void setPreview_text(String preview_text) {
		this.preview_text = preview_text;
	}
	public String getDetail_text() {
		return detail_text;
	}
	public void setDetail_text(String detail_text) {
		this.detail_text = detail_text;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getCounter() {
		return counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
	public Category getCat() {
		return cat;
	}
	public void setCat(Category cat) {
		this.cat = cat;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public News(int id, String name, String preview_text, String detail_text, Timestamp date_create, String picture,
			int counter, Category cat, User user, boolean state) {
		super();
		this.id = id;
		this.name = name;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.date_create = date_create;
		this.picture = picture;
		this.counter = counter;
		this.cat = cat;
		this.user = user;
		this.state = state;
	}
	public News() {
		super();
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", name=" + name + ", preview_text=" + preview_text + ", detail_text=" + detail_text
				+ ", date_create=" + date_create + ", picture=" + picture + ", counter=" + counter + ", cat=" + cat
				+ ", user=" + user + ", state=" + state + "]";
	}
	
}

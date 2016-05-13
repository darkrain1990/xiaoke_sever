package com.xiaoke.entity;

public class User {
	
	private int id;
	private String name;
	private String passworld;
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
	public String getPassworld() {
		return passworld;
	}
	public void setPassworld(String passworld) {
		this.passworld = passworld;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", passworld=" + passworld
				+ "]";
	}
	public User(int id, String name, String passworld) {
		super();
		this.id = id;
		this.name = name;
		this.passworld = passworld;
	}
	public User() {
		super();
	}
	
	
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Data;

/**
 *
 * @author Mr Loi Ho
 */
@Data
public class Employee {

    private String id;
    private String name;
    private String email;

    public Employee(String id, String name, String email) {
        this.setId(id);
        this.setName(name);
        this.setEmail(email);
    }

    public Employee() {
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}

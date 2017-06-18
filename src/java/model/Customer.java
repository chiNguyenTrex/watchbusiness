/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ChiNguyen
 */
public class Customer extends Admin {
    private String address;

    public Customer() {
    }

    public Customer(String address, String usename, String password, String name, String email, String phone) {
        super(usename, password, name, email, phone);
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

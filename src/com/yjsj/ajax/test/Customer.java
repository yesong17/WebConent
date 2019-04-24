package com.yjsj.ajax.test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Arrays;
import java.util.List;

public class Customer {
    private  String name;
    private String id;

    public Customer(String name, String id) {
        this.name = name;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    //@JsonIgnore
    public String getCustomBirth(){
        return "1990-12-12";
    }

    public String getCity(){
        return "BeiJing";
    }


    public static void main(String[] args) throws JsonProcessingException,Exception {
        ObjectMapper mapper = new ObjectMapper();

        Customer customer = new Customer("Yjsj","1001");

        String jsonStr = mapper.writeValueAsString(customer);
        System.out.println(jsonStr);

        List<Customer>customers = Arrays.asList(customer,new Customer("CBD","2002"));
        jsonStr = mapper.writeValueAsString(customers);
        System.out.println(jsonStr);
    }
}

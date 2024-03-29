package com.hossein.eshopweb.dao;

import com.hossein.eshopweb.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Customer findByEmail(String theEmail); // will return null if not found
}
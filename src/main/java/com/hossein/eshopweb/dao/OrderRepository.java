package com.hossein.eshopweb.dao;

import com.hossein.eshopweb.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
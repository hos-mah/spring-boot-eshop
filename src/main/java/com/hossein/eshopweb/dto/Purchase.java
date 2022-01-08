package com.hossein.eshopweb.dto;

import com.hossein.eshopweb.entity.Address;
import com.hossein.eshopweb.entity.Customer;
import com.hossein.eshopweb.entity.Order;
import com.hossein.eshopweb.entity.OrderItem;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}

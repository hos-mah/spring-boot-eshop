package com.hossein.eshopweb.service;

import com.hossein.eshopweb.dao.CustomerRepository;
import com.hossein.eshopweb.dto.Purchase;
import com.hossein.eshopweb.dto.PurchaseResponse;
import com.hossein.eshopweb.entity.Customer;
import com.hossein.eshopweb.entity.Order;
import com.hossein.eshopweb.entity.OrderItem;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Set;
import java.util.UUID;

@Service
public class CheckoutServiceImpl implements CheckoutService{
    private CustomerRepository customerRepository;

    public CheckoutServiceImpl(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Override
    @Transactional
    public PurchaseResponse placeOrder(Purchase purchase) {
        // retrieve order info from dto
        Order order = purchase.getOrder();
        // generate tracking number
        String trackingNumber = generateOrderTrackingNumber();
        order.setOrderTrackingNumber(trackingNumber);
        //populate order and orderItems
        Set<OrderItem> orderItems = purchase.getOrderItems();
        for (OrderItem item : orderItems) {
            order.addItem(item);
        }
        //populate order with addresses
        order.setShippingAddress(purchase.getShippingAddress());
        order.setBillingAddress(purchase.getBillingAddress());
        //populate customer with order
        Customer customer = purchase.getCustomer();
        //check if the customer exists
        String theEmail = customer.getEmail();
        Customer customerByEmail = customerRepository.findByEmail(theEmail);
        if (customerByEmail != null) {
            // assign the existing customer
            customer = customerByEmail;
        }
        customer.addOrder(order);
        order.setCustomer(customer);
        customerRepository.save(customer);
        //return response
        return new PurchaseResponse(trackingNumber);
    }

    private String generateOrderTrackingNumber() {
        //UUID: Universally Unique Identifier
        return UUID.randomUUID().toString();
    }
}

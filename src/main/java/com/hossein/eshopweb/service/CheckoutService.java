package com.hossein.eshopweb.service;

import com.hossein.eshopweb.dto.Purchase;
import com.hossein.eshopweb.dto.PurchaseResponse;

public interface CheckoutService {
    PurchaseResponse placeOrder(Purchase purchase);
}

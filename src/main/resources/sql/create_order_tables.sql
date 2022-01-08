-- -----------------------------------------------------
-- Schema full_stack_shop
-- -----------------------------------------------------
SET SCHEMA 'full_stack_shop';

--
-- Prep work
--
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS address;

--
-- Table structure for table `address`
--
CREATE SEQUENCE address_seq;
CREATE TABLE address
(
    id       bigint NOT NULL DEFAULT NEXTVAL('address_seq'),
    city     varchar(255)    DEFAULT NULL,
    country  varchar(255)    DEFAULT NULL,
    state    varchar(255)    DEFAULT NULL,
    street   varchar(255)    DEFAULT NULL,
    zip_code varchar(255)    DEFAULT NULL,
    PRIMARY KEY (id)
);
ALTER SEQUENCE address_seq RESTART WITH 1;
--
-- Table structure for table `customer`
--
CREATE SEQUENCE customer_seq;
CREATE TABLE customer
(
    id         bigint NOT NULL DEFAULT NEXTVAL('customer_seq'),
    first_name varchar(255)    DEFAULT NULL,
    last_name  varchar(255)    DEFAULT NULL,
    email      varchar(255)    DEFAULT NULL,
    PRIMARY KEY (id)
);
ALTER SEQUENCE customer_seq RESTART WITH 1;
--
-- Table structure for table `orders`
--
CREATE SEQUENCE orders_seq;
CREATE TABLE orders
(
    id                    bigint NOT NULL DEFAULT NEXTVAL('orders_seq'),
    order_tracking_number varchar(255)    DEFAULT NULL,
    total_price           decimal(19, 2)  DEFAULT NULL,
    total_quantity        int             DEFAULT NULL,
    billing_address_id    bigint          DEFAULT NULL,
    customer_id           bigint          DEFAULT NULL,
    shipping_address_id   bigint          DEFAULT NULL,
    status                varchar(128)    DEFAULT NULL,
    date_created          timestamp(6)    DEFAULT NULL,
    last_updated          timestamp(6)    DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT UK_billing_address_id UNIQUE (billing_address_id),
    CONSTRAINT UK_shipping_address_id UNIQUE (shipping_address_id),
    CONSTRAINT FK_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id),
    CONSTRAINT FK_billing_address_id FOREIGN KEY (billing_address_id) REFERENCES address (id),
    CONSTRAINT FK_shipping_address_id FOREIGN KEY (shipping_address_id) REFERENCES address (id)
);

ALTER SEQUENCE orders_seq RESTART WITH 1;
CREATE INDEX K_customer_id ON orders (customer_id);
--
-- Table structure for table `order_items`
--
CREATE SEQUENCE order_item_seq;

CREATE TABLE order_item
(
    id         bigint NOT NULL DEFAULT NEXTVAL('order_item_seq'),
    image_url  varchar(255)    DEFAULT NULL,
    quantity   int             DEFAULT NULL,
    unit_price decimal(19, 2)  DEFAULT NULL,
    order_id   bigint          DEFAULT NULL,
    product_id bigint          DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_order_id FOREIGN KEY (order_id) REFERENCES orders (id),
    CONSTRAINT FK_product_id FOREIGN KEY (product_id) REFERENCES product (id)
);

ALTER SEQUENCE order_item_seq RESTART WITH 1;

CREATE INDEX K_order_id ON order_item (order_id);
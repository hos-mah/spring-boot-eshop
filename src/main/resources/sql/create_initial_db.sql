-- *** ------------------------------------
-- *** shop-app
-- *** ------------------------------------

DROP SCHEMA IF EXISTS full_stack_shop;

CREATE SCHEMA full_stack_shop;
SET SCHEMA 'full_stack_shop';

-- *** ------------------------------------
-- *** shop-app.product_category
-- *** ------------------------------------

CREATE SEQUENCE full_stack_shop.product_category_seq;

CREATE TABLE IF NOT EXISTS full_stack_shop.product_category
(
    id            BIGINT       NOT NULL DEFAULT NEXTVAL('full_stack_shop.product_category_seq'),
    category_name VARCHAR(255) NULL     DEFAULT NULL,
    PRIMARY KEY (id)
)
;

ALTER SEQUENCE full_stack_shop.product_category_seq RESTART WITH 1;

-- *** ------------------------------------
-- *** shop-app.product
-- *** ------------------------------------

CREATE SEQUENCE full_stack_shop.product_seq;

CREATE TABLE IF NOT EXISTS full_stack_shop.product
(
    id             BIGINT NOT NULL DEFAULT NEXTVAL('full_stack_shop.product_seq'),
    sku            VARCHAR(255)    DEFAULT NULL,
    name           VARCHAR(255)    DEFAULT NULL,
    description    VARCHAR(255)    DEFAULT NULL,
    unit_price     DECIMAL(13, 2)  DEFAULT NULL,
    image_url      VARCHAR(255)    DEFAULT NULL,
    active         BOOLEAN         DEFAULT TRUE,
    units_in_stock INT             DEFAULT NULL,
    date_created   TIMESTAMP(6)    DEFAULT NULL,
    last_updated   TIMESTAMP(6)    DEFAULT NULL,
    category_id    BIGINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES product_category (id)
)
;

ALTER SEQUENCE full_stack_shop.product_seq RESTART WITH 1;

CREATE INDEX fk_category ON full_stack_shop.product (category_id);


-- *** ------------------------------------
-- Add sample data
-- *** ------------------------------------

INSERT INTO product_category(category_name)
VALUES ('BOOKS');

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
                     unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1000', 'JavaScript - The Fun Parts', 'Learn JavaScript',
        'assets/images/products/placeholder.png'
           , TRUE, 100, 19.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
                     unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1001', 'Spring Framework Tutorial', 'Learn Spring',
        'assets/images/products/placeholder.png'
           , TRUE, 100, 29.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
                     unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1002', 'Kubernetes - Deploying Containers', 'Learn Kubernetes',
        'assets/images/products/placeholder.png'
           , TRUE, 100, 24.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
                     unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1003', 'Internet of Things (IoT) - Getting Started', 'Learn IoT',
        'assets/images/products/placeholder.png'
           , TRUE, 100, 29.99, 1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
                     unit_price, category_id, date_created)
VALUES ('BOOK-TECH-1004', 'The Go Programming Language: A to Z', 'Learn Go',
        'assets/images/products/placeholder.png'
           , TRUE, 100, 24.99, 1, NOW());



DROP SCHEMA full_stack_shop CASCADE;

select *
from full_stack_shop.product;

select *
from full_stack_shop.product_category;

delete
from full_stack_shop.product
where description is null;

update product
set category_id = 1
where id>1;


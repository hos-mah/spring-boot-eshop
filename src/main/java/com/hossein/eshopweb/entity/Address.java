package com.hossein.eshopweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Table(name = "address")
@Entity
@Getter
@Setter
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "street")
    private String street;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "country")
    private String country;

    @Column(name = "zip_code")
    private String zipCode ;

    @OneToOne
    @PrimaryKeyJoinColumn
    private Order order;
}
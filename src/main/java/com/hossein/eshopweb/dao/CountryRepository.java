package com.hossein.eshopweb.dao;

import com.hossein.eshopweb.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
public interface CountryRepository extends JpaRepository<Country, Integer> {
}
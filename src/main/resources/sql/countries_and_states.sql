CREATE SEQUENCE IF NOT EXISTS full_stack_shop.country_seq;

create table IF NOT EXISTS full_stack_shop.country
(
    id   SMALLINT NOT NULL DEFAULT NEXTVAL('full_stack_shop.country_seq'),
    code VARCHAR(2)        DEFAULT NULL,
    name VARCHAR(255)      DEFAULT NULL,
    PRIMARY KEY (id)
);


CREATE SEQUENCE IF NOT EXISTS full_stack_shop.state_seq;

create table IF NOT EXISTS full_stack_shop.state
(
    id   SMALLINT NOT NULL DEFAULT NEXTVAL('full_stack_shop.state_seq'),
    name VARCHAR(255)      DEFAULT NULL,
    country_id SMALLINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES full_stack_shop.country (id)
);


insert into full_stack_shop.country values (1, 'IR', 'Iran');
insert into full_stack_shop.country values (2, 'NL', 'Netherlands');
insert into full_stack_shop.country values (3, 'BR', 'Brazil');
insert into full_stack_shop.country values (4, 'DK', 'Denmark');
insert into full_stack_shop.country values (5, 'TR', 'Turkey');
insert into full_stack_shop.country values (6, 'DE', 'Germany');


insert into full_stack_shop.state values (3927, 'Razavi Khorasan Province', 1);
insert into full_stack_shop.state values (3938, 'Mazandaran Province', 1);
insert into full_stack_shop.state values (3916, 'Markazi Province', 1);
insert into full_stack_shop.state values (3943, 'Kerman Province', 1);
insert into full_stack_shop.state values (3917, 'Khuzestan Province', 1);
insert into full_stack_shop.state values (3918, 'Ilam Province', 1);
insert into full_stack_shop.state values (3919, 'Kermanshah Province', 1);
insert into full_stack_shop.state values (3920, 'Gilan Province', 1);
insert into full_stack_shop.state values (3921, 'Chaharmahal and Bakhtiari Province', 1);
insert into full_stack_shop.state values (3922, 'Qom Province', 1);
insert into full_stack_shop.state values (3923, 'Isfahan Province', 1);
insert into full_stack_shop.state values (3924, 'West Azarbaijan Province', 1);
insert into full_stack_shop.state values (3925, 'Zanjan Province', 1);
insert into full_stack_shop.state values (3926, 'Kohgiluyeh and Boyer-Ahmad Province', 1);
insert into full_stack_shop.state values (3928, 'Lorestan Province', 1);
insert into full_stack_shop.state values (3929, 'Alborz Province', 1);
insert into full_stack_shop.state values (3930, 'South Khorasan Province', 1);
insert into full_stack_shop.state values (3931, 'Sistan and Baluchestan', 1);
insert into full_stack_shop.state values (3932, 'Bushehr Province', 1);
insert into full_stack_shop.state values (3933, 'Golestan Province', 1);
insert into full_stack_shop.state values (3934, 'Ardabil Province', 1);
insert into full_stack_shop.state values (3935, 'Kurdistan Province', 1);
insert into full_stack_shop.state values (3936, 'Yazd Province', 1);
insert into full_stack_shop.state values (3937, 'Hormozgan Province', 1);
insert into full_stack_shop.state values (3939, 'Fars Province', 1);
insert into full_stack_shop.state values (3940, 'Semnan Province', 1);
insert into full_stack_shop.state values (3941, 'Qazvin Province', 1);
insert into full_stack_shop.state values (3942, 'North Khorasan Province', 1);
insert into full_stack_shop.state values (3944, 'East Azerbaijan Province', 1);
insert into full_stack_shop.state values (3945, 'Tehran Province', 1);


insert into full_stack_shop.state values (2623, 'North Brabant', 2);
insert into full_stack_shop.state values (2610, 'Utrecht', 2);
insert into full_stack_shop.state values (2611, 'Gelderland', 2);
insert into full_stack_shop.state values (2612, 'North Holland', 2);
insert into full_stack_shop.state values (2613, 'Drenthe', 2);
insert into full_stack_shop.state values (2614, 'South Holland', 2);
insert into full_stack_shop.state values (2615, 'Limburg', 2);
insert into full_stack_shop.state values (2616, 'Sint Eustatius', 2);
insert into full_stack_shop.state values (2617, 'Groningen', 2);
insert into full_stack_shop.state values (2618, 'Overijssel', 2);
insert into full_stack_shop.state values (2619, 'Flevoland', 2);
insert into full_stack_shop.state values (2620, 'Zeeland', 2);
insert into full_stack_shop.state values (2621, 'Saba', 2);
insert into full_stack_shop.state values (2622, 'Friesland', 2);
insert into full_stack_shop.state values (2624, 'Bonaire', 2);


insert into full_stack_shop.state values (1528, 'Region Zealand', 4);
insert into full_stack_shop.state values (1529, 'Region of Southern Denmark',4);
insert into full_stack_shop.state values (1530, 'Capital Region of Denmark',4);
insert into full_stack_shop.state values (1531, 'Central Denmark Region', 4);
insert into full_stack_shop.state values (1532, 'North Denmark Region', 4);


insert into full_stack_shop.state values (1,'Acre',3);
insert into full_stack_shop.state values (2,'Alagoas',3);
insert into full_stack_shop.state values (3,'Amap??',3);
insert into full_stack_shop.state values (4,'Amazonas',3);
insert into full_stack_shop.state values (5,'Bahia',3);
insert into full_stack_shop.state values (6,'Cear??',3);
insert into full_stack_shop.state values (7,'Distrito Federal',3);
insert into full_stack_shop.state values (8,'Esp??rito Santo',3);
insert into full_stack_shop.state values (9,'Goi??s',3);
insert into full_stack_shop.state values (10,'Maranh??o',3);
insert into full_stack_shop.state values (11,'Mato Grosso do Sul',3);
insert into full_stack_shop.state values (12,'Mato Grosso',3);
insert into full_stack_shop.state values (13,'Minas Gerais',3);
insert into full_stack_shop.state values (14,'Paran??',3);
insert into full_stack_shop.state values (15,'Para??ba',3);
insert into full_stack_shop.state values (16,'Par??',3);
insert into full_stack_shop.state values (17,'Pernambuco',3);
insert into full_stack_shop.state values (18,'Piaui',3);
insert into full_stack_shop.state values (19,'Rio de Janeiro',3);
insert into full_stack_shop.state values (20,'Rio Grande do Norte',3);
insert into full_stack_shop.state values (21,'Rio Grande do Sul',3);
insert into full_stack_shop.state values (22,'Rond??nia',3);
insert into full_stack_shop.state values (23,'Roraima',3);
insert into full_stack_shop.state values (24,'Santa Catarina',3);
insert into full_stack_shop.state values (25,'Sergipe',3);
insert into full_stack_shop.state values (26,'S??o Paulo',3);
insert into full_stack_shop.state values (27,'Tocantins',3);


insert into full_stack_shop.state values (41,'Baden-W??rttemberg',6);
insert into full_stack_shop.state values (42,'Bavaria',6);
insert into full_stack_shop.state values (43,'Berlin',6);
insert into full_stack_shop.state values (44,'Brandenburg',6);
insert into full_stack_shop.state values (45,'Bremen',6);
insert into full_stack_shop.state values (46,'Hamburg',6);
insert into full_stack_shop.state values (47,'Hesse',6);
insert into full_stack_shop.state values (48,'Lower Saxony',6);
insert into full_stack_shop.state values (49,'Mecklenburg-Vorpommern',6);
insert into full_stack_shop.state values (50,'North Rhine-Westphalia',6);
insert into full_stack_shop.state values (51,'Rhineland-Palatinate',6);
insert into full_stack_shop.state values (52,'Saarland',6);
insert into full_stack_shop.state values (53,'Saxony',6);
insert into full_stack_shop.state values (54,'Saxony-Anhalt',6);
insert into full_stack_shop.state values (55,'Schleswig-Holstein',6);
insert into full_stack_shop.state values (56,'Thuringia',6);


insert into full_stack_shop.state values (144,'Ad??yaman',5);
insert into full_stack_shop.state values (145,'Afyonkarahisar',5);
insert into full_stack_shop.state values (146,'A??r??',5);
insert into full_stack_shop.state values (147,'Aksaray',5);
insert into full_stack_shop.state values (148,'Amasya',5);
insert into full_stack_shop.state values (149,'Ankara',5);
insert into full_stack_shop.state values (150,'Antalya',5);
insert into full_stack_shop.state values (151,'Ardahan',5);
insert into full_stack_shop.state values (152,'Artvin',5);
insert into full_stack_shop.state values (153,'Ayd??n',5);
insert into full_stack_shop.state values (154,'Bal??kesir',5);
insert into full_stack_shop.state values (155,'Bart??n',5);
insert into full_stack_shop.state values (156,'Batman',5);
insert into full_stack_shop.state values (157,'Bayburt',5);
insert into full_stack_shop.state values (158,'Bilecik',5);
insert into full_stack_shop.state values (159,'Bing??l',5);
insert into full_stack_shop.state values (160,'Bitlis',5);
insert into full_stack_shop.state values (161,'Bolu',5);
insert into full_stack_shop.state values (162,'Burdur',5);
insert into full_stack_shop.state values (163,'Bursa',5);
insert into full_stack_shop.state values (164,'??anakkale',5);
insert into full_stack_shop.state values (165,'??ank??r??',5);
insert into full_stack_shop.state values (166,'??orum',5);
insert into full_stack_shop.state values (167,'Denizli',5);
insert into full_stack_shop.state values (168,'Diyarbak??r',5);
insert into full_stack_shop.state values (169,'D??zce',5);
insert into full_stack_shop.state values (170,'Edirne',5);
insert into full_stack_shop.state values (171,'Elaz????',5);
insert into full_stack_shop.state values (172,'Erzincan',5);
insert into full_stack_shop.state values (173,'Erzurum',5);
insert into full_stack_shop.state values (174,'Eski??ehir',5);
insert into full_stack_shop.state values (175,'Gaziantep',5);
insert into full_stack_shop.state values (176,'Giresun',5);
insert into full_stack_shop.state values (177,'G??m????hane',5);
insert into full_stack_shop.state values (178,'Hakk??ri',5);
insert into full_stack_shop.state values (179,'Hatay',5);
insert into full_stack_shop.state values (180,'I??d??r',5);
insert into full_stack_shop.state values (181,'Isparta',5);
insert into full_stack_shop.state values (182,'??stanbul',5);
insert into full_stack_shop.state values (183,'??zmir',5);
insert into full_stack_shop.state values (184,'Kahramanmara??',5);
insert into full_stack_shop.state values (185,'Karab??k',5);
insert into full_stack_shop.state values (186,'Karaman',5);
insert into full_stack_shop.state values (187,'Kars',5);
insert into full_stack_shop.state values (188,'Kastamonu',5);
insert into full_stack_shop.state values (189,'Kayseri',5);
insert into full_stack_shop.state values (190,'K??r??kkale',5);
insert into full_stack_shop.state values (191,'K??rklareli',5);
insert into full_stack_shop.state values (192,'K??r??ehir',5);
insert into full_stack_shop.state values (193,'Kilis',5);
insert into full_stack_shop.state values (194,'Kocaeli',5);
insert into full_stack_shop.state values (195,'Konya',5);
insert into full_stack_shop.state values (196,'K??tahya',5);
insert into full_stack_shop.state values (197,'Malatya',5);
insert into full_stack_shop.state values (198,'Manisa',5);
insert into full_stack_shop.state values (199,'Mardin',5);
insert into full_stack_shop.state values (200,'Mersin',5);
insert into full_stack_shop.state values (201,'Mu??la',5);
insert into full_stack_shop.state values (202,'Mu??',5);
insert into full_stack_shop.state values (203,'Nev??ehir',5);
insert into full_stack_shop.state values (204,'Ni??de',5);
insert into full_stack_shop.state values (205,'Ordu',5);
insert into full_stack_shop.state values (206,'Osmaniye',5);
insert into full_stack_shop.state values (207,'Rize',5);
insert into full_stack_shop.state values (208,'Sakarya',5);
insert into full_stack_shop.state values (209,'Samsun',5);
insert into full_stack_shop.state values (210,'Siirt',5);
insert into full_stack_shop.state values (211,'Sinop',5);
insert into full_stack_shop.state values (212,'Sivas',5);
insert into full_stack_shop.state values (213,'??anl??urfa',5);
insert into full_stack_shop.state values (214,'????rnak',5);
insert into full_stack_shop.state values (215,'Tekirda??',5);
insert into full_stack_shop.state values (216,'Tokat',5);
insert into full_stack_shop.state values (217,'Trabzon',5);
insert into full_stack_shop.state values (218,'Tunceli',5);
insert into full_stack_shop.state values (219,'U??ak',5);
insert into full_stack_shop.state values (220,'Van',5);
insert into full_stack_shop.state values (221,'Yalova',5);
insert into full_stack_shop.state values (222,'Yozgat',5);
insert into full_stack_shop.state values (223,'Zonguldak',5);
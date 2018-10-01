CREATE database formula1_db;
USE formula1_db;
CREATE table paises (sigla varchar (3) primary key, nome varchar (100), hino varchar (255), bandeira varchar (255)) engine=InnoDB default charset=utf8;
CREATE table equipes (id int primary key auto_increment, nome varchar (255), escudo varchar (100),id_pais varchar(3), foreign key (id_pais) references paises (sigla)) engine=InnoDB default charset=utf8;
CREATE table pilotos (id int primary key auto_increment, nome varchar (255), n_carro int, altura decimal (3,2), peso decimal(3,1), dt_nascimento date, id_pais varchar (3), id_equipe int, foreign key(id_pais) references paises(sigla), foreign key(id_equipe) references equipes (id)) engine=InnoDB default charset=utf8;
CREATE table circuitos(id int primary key auto_increment,nome varchar(100), id_pais varchar (3), foreign key (id_pais) references paises (sigla)) engine=InnoDB default charset=utf8;
CREATE table corridas (id int primary key auto_increment, descricao varchar(255),id_circuito int,foreign key(id_circuito) references circuitos(id)) engine=InnoDB default charset=utf8;
CREATE table posicoes (id int primary key auto_increment, pontos int) engine=InnoDB default charset=utf8;
CREATE table pilotos_corridas(id_piloto int,id_corrida int,dt_corrida date, id_posicao int,tempo varchar(20), primary key(id_corrida,id_posicao), foreign key(id_piloto) references pilotos(id),foreign key(id_corrida) references corridas(id), foreign key(id_posicao) references posicoes(id)) engine=InnoDB default charset=utf8;


INSERT INTO paises (sigla, nome) values
('NLD', 'Holanda'), ('GBR', 'Reino Unido'), ('DEU', 'Alemanha'), ('FIN', 'Finlândia'), ('AUS', 'Austrália'),
('ESP', 'Espanha'), ('MCO', 'Mônaco'), ('CHE', 'Suíça'), ('BEL', 'Bélgica'), ('FRA', 'França'),
('CAN', 'Canadá'), ('MEX', 'México'), ('DNK', 'Dinamarca'), ('RUS', 'Rússia'), ('AUT', 'Áustria'),
('ITA', 'Itália'), ('USA','Estados Unidos'), ('ENG', 'Inglaterra'), ('SWE','Suécia'), ('NZL','Nova Zelândia'),
('BHR', 'Bahrein'), ('CHN','China'), ('AZE','Azerbaijão'), ('HUN','Hungria'), ('SGP','Singapura'),
('JPN','Japão'), ('BRA','Brasil'), ('ARE','Emirados Árabes Unidos');

INSERT INTO equipes (nome, id_pais) values 
('Mercedes', 'DEU'), ('Red Bull', 'AUT'), ('McLaren', 'GBR'), ('Renault', 'FRA'), ('Sauber','CHE'),
('Ferrari','ITA'), ('Toro Rosso','ITA'), ('Williams','GBR'), ('Haas','USA'), ('Sahara Force India','GBR');

INSERT INTO pilotos (nome, n_carro, altura, peso, dt_nascimento, id_pais, id_equipe) values 
('Lewis Hamilton', 44, 1.74, 68.0,'1985-01-07','ENG',1), ('Max Verstappen', 33, 1.80, 67.0,'1997-09-30','NLD',2),
('Sebastian Vettel', 05, 1.74, 64.0,'1987-07-03','DEU',6), ('Valtteri Bottas', 77 , 1.73, 70.0,'1989-08-28','FIN',1),
('Kimi Räikkönen', 07, 1.75, 62.0,'1979-10-17','FIN',6), ('Daniel Ricciardo', 03, 1.78, 66.0,'1989-07-01','AUS',2),
('Fernando Alonso', 14, 1.71, 68.0,'1981-07-29','ESP',3), ('Carlos Sainz Jr.', 55, 1.78, 66.0,'1994-09-01','ESP',4),
('Charles Leclerc', 16, 1.80, 67.0,'1997-10-16','MCO',5), ('Nico Hülkenberg', 27, 1.84, 74.0,'1987-08-19','DEU',4),
('Marcus Ericsson', 09, 1.80, 64.0,'1990-09-02','SWE',5), ('Stoffel Vandoorne', 02, 1.77, 67.0,'1992-03-26','BEL',3),
('Pierre Gasly', 10, 1.77, 68.0,'1996-02-07','FRA',7), ('Lance Stroll',18, 1.82, 70.0,'1998-10-29','CAN',8),
('Romain Grosjean', 08, 1.80, 71.0,'1986-04-17','CHE',9), ('Sérgio Pérez', 11, 1.73, 63.0,'1990-01-26','MEX',10),
('Brendon Hartley', 28, 1.84, 67.0,'1989-11-10','NZL',7), ('Kevin Magnussen', 20, 1.74, 68.0,'1992-10-05','DNK',9),
('Sergey Sirotkin', 35, 1.84, 71.0,'1995-08-27','RUS',8), ('Esteban Ocon', 31, 1.86, 66.0,'1996-09-17','FRA',10);

INSERT INTO circuitos (nome, id_pais) values 
('Circuito de Albert Park', 'AUS'), ('Circuito Internaconal do Bahrein', 'BHR'), ('Circuito Internacional de Xangai', 'CHN'), ('Circiuto Urbano de Baku', 'AZE'), ('Circuito de Barcelona-Catalunha', 'ESP'),
('Circuito de Mônaco', 'MCO'), ('Circuito Gilles Villeneuve', 'CAN'), ('Circuito de Paul Ricard', 'FRA'), ('Red Bull Ring', 'AUT'), ('Circuito de Silverstone', 'GBR'),
('Hockenheimring', 'DEU'), ('Hungaroring', 'HUN'), ('Circuito de Spa-Francorchamps', 'BEL'), ('Autódromo Nacional de Monza', 'ITA'), ('Circuito Urbano de Marina Bay', 'SGP'),
('Autódromo de Sóchi', 'RUS'), ('Circuito de Suzuka', 'JPN'), ('Circuito das Américas', 'USA'), ('Autódromo Hermanos Rodríguez', 'MEX'), ('Autódromo de Interlagos', 'BRA'),
('Circuito de Yas Marina', 'ARE');

INSERT INTO corridas (descricao, id_circuito) values 
('GP da Austrália',1),  ('GP do Bahrein',2), ('GP da China',3), ('GP do Azerbaijão',4), ('GP da Espanha',5),
('GP de Mônaco',6),  ('GP do Canadá',7), ('GP da França',8), ('GP da Áustria',9), ('GP da Grã-Bretanha',10),
('GP da Alemanha',11),  ('GP da Hungria',12), ('GP da Bélgica',13), ('GP da Itália',14), ('GP de Singapura',15),
('GP da Rússia',16),  ('GP do Japão',17), ('GP dos Estados Unidos',18), ('GP do México',19), ('GP do Brasil',20),
('GP de Abu Dhabi',21);

INSERT INTO posicoes (pontos) values 
(25), (18), (15), (12), (10), (08), (06), (04), (02), (01),
(00), (00), (00), (00), (00), (00), (00), (00), (00), (00);

INSERT INTO pilotos_corridas (id_piloto, id_corrida, dt_corrida, id_posicao, tempo) values 
(3, 1, '2018-03-25', 1,'1:29:33.283'), (1, 1, '2018-03-25',2,'+5.036 s'), (5, 1, '2018-03-25',3,'+6.309 s'), (6, 1, '2018-03-25', 4,'+7.069 s'), (7, 1, '2018-03-25', 5,'+27.886 s'),
(2, 1, '2018-03-25', 6,'+28.945 s'), (10, 1, '2018-03-25', 7,'+32.671 s'), (4, 1, '2018-03-25', 8,'+34.339 s'), (12, 1, '2018-03-25', 9,'+34.921 s'), (8, 1, '2018-03-25', 10,'+45.722 s'),
(16, 1, '2018-03-25', 11,'+46.817 s'), (20, 1, '2018-03-25', 12,'+60.278 s'), (9, 1, '2018-03-25', 13,'+75.759 s'), (14, 1, '2018-03-25', 14,'+78.288 s'), (17, 1, '2018-03-25', 15,'Mais 1 volta'),
(15, 1, '2018-03-25', 16,'Não concluiu'), (18, 1, '2018-03-25', 17,'Não concluiu'), (13, 1, '2018-03-25', 18,'Não concluiu'), (11, 1, '2018-03-25', 19,'Não concluiu'), (19, 1, '2018-03-25', 20,'Não concluiu'),

(3, 2, '2018-04-08', 1,'1:32:01.940'), (4, 2, '2018-04-08', 2,'+0.699 s'), (1, 2, '2018-04-08', 3,'+6.512 s'), (13, 2, '2018-04-08', 4,'+62.234 s'), (18, 2, '2018-04-08', 5,'+75.046 s'),
(10, 2,'2018-04-08', 6,'+99.024 s'), (7, 2,'2018-04-08', 7,'Mais 1 volta'), (12, 2,'2018-04-08', 8,'Mais 1 volta'), (11, 2,'2018-04-08', 9,'Mais 1 volta'), (20, 2,'2018-04-08', 10,'Mais 1 volta'),
(8, 2,'2018-04-08', 11,'Mais 1 volta'), (9, 2,'2018-04-08', 12,'Mais 1 volta'), (15, 2,'2018-04-08', 13,'Mais 1 volta'), (14, 2,'2018-04-08', 14,'Mais 1 volta'), (19, 2,'2018-04-08', 15,'Mais 1 volta'),
(16, 2,'2018-04-08', 16,'Mais 1 volta'), (17, 2,'2018-04-08', 17,'Mais 1 volta'), (5, 2,'2018-04-08', 18,'Não concluiu'), (2, 2,'2018-04-08', 19,'Não concluiu'), (6, 2,'2018-04-08', 20,'Não concluiu'),

(6, 3,'2018-04-15', 1,'1:35:36.380'), (4, 3,'2018-04-15', 2,'+8.894 s'), (5, 3,'2018-04-15', 3,'+9.637 s'), (1, 3,'2018-04-15', 4,'+16.985 s'), (2, 3,'2018-04-15', 5,'+20.436 s'),
(10, 3,'2018-04-15', 6,'+21.052 s'), (7, 3,'2018-04-15', 7,'+30.639 s'), (3, 3,'2018-04-15', 8,'+35.286 s'), (8, 3,'2018-04-15', 9,'35.763 s'), (18, 3,'2018-04-15', 10,'+39.594 s'),
(20, 3,'2018-04-15', 11,'44.050 s'), (16, 3,'2018-04-15', 12,'+44.725 s'), (12, 3,'2018-04-15', 13,'+49.373 s'), (14, 3,'2018-04-15', 14,'+55.490 s'), (19, 3,'2018-04-15', 15,'+58.241 s'),
(11, 3,'2018-04-15', 16,'+62.604 s'), (15, 3,'2018-04-15', 17,'+65.296 s'), (13, 3,'2018-04-15', 18,'+66.330 s'), (9, 3,'2018-04-15', 19,'+82.575 s'), (17, 3,'2018-04-15', 20,'Não concluiu'),

(1, 4,'2018-04-29', 1,'1:43:44.291'), (5, 4,'2018-04-29', 2,'+2.460 s'), (16, 4,'2018-04-29', 3,'+4.024 s'), (3, 4,'2018-04-29', 4,'+5.329 s'), (8, 4,'2018-04-29', 5,'+7.515 s'),
(9, 4,'2018-04-29', 6,'+9.158 s'), (7, 4,'2018-04-29', 7,'+10.931 s'), (14, 4,'2018-04-29', 8,'+12.546 s'), (12, 4,'2018-04-29', 9,'+14.152 s'), (17, 4,'2018-04-29', 10,'+18.030 s'),
(11, 4,'2018-04-29', 11,'+18.512 s'), (13, 4,'2018-04-29', 12,'+24.720 s'), (18, 4,'2018-04-29', 13,'+40.663 s'), (4, 4,'2018-04-29', 14,'Não concluiu'), (15, 4,'2018-04-29', 15,'Não concluiu'),
(2, 4,'2018-04-29', 16,'Não concluiu'), (6, 4,'2018-04-29', 17,'Não concluiu'), (10, 4,'2018-04-29', 18,'Não concluiu'), (20, 4,'2018-04-29', 19,'Não concluiu'), (19, 4,'2018-04-29', 20,'Não concluiu'),

(1, 5,'2018-05-13', 1,'1:35:29.972'), (4, 5,'2018-05-13', 2,'+20.593 s'), (2, 5,'2018-05-13', 3,'+26.873 s'), (3, 5,'2018-05-13', 4,'+27.584 s'), (6, 5,'2018-05-13', 5,'+50.058 s'),
(18, 5,'2018-05-13', 6,'Mais 1 volta'), (8, 5,'2018-05-13', 7,'Mais 1 volta'), (7, 5,'2018-05-13', 8,'Mais 1 volta'), (16, 5,'2018-05-13', 9,'Mais 2 voltas'), (9, 5,'2018-05-13', 10,'Mais 2 voltas'),
(14, 5,'2018-05-13', 11,'Mais 2 voltas'), (17, 5,'2018-05-13', 12,'Mais 2 voltas'), (11, 5,'2018-05-13', 13,'Mais 2 voltas'), (19, 5,'2018-05-13', 14,'Mais 3 voltas'), (12, 5,'2018-05-13', 15,'Não concluiu'),
(20, 5,'2018-05-13', 16,'Não concluiu'), (5, 5,'2018-05-13', 17,'Não concluiu'), (15, 5,'2018-05-13', 18,'Não concluiu'), (13, 5,'2018-05-13', 19,'Não concluiu'), (10, 5,'2018-05-13', 20,'Não concluiu'),

(6, 6,'2018-05-27', 1,'1:42:54.807'), (3, 6,'2018-05-27', 2,'+7.336 s'), (1, 6,'2018-05-27', 3,'+17.013 s'), (5, 6,'2018-05-27', 4,'+18.127 s'), (4, 6,'2018-05-27', 5,'18.822 s'),
(20, 6,'2018-05-27', 6,'+23.667 s'), (13, 6,'2018-05-27', 7,'+24.331 s'), (10, 6,'2018-05-27', 8,'+24.839 s'), (2, 6,'2018-05-27', 9,'+25.317 s'), (8, 6,'2018-05-27', 10,'+69.013 s'),
(11, 6,'2018-05-27', 11,'+69.864 s'), (16, 6,'2018-05-27', 12,'+70.461 s'), (18, 6,'2018-05-27', 13,'+74.823 s'), (12, 6,'2018-05-27', 14,'Mais 1 volta'), (15, 6,'2018-05-27', 15,'Mais 1 volta'),
(19, 6,'2018-05-27', 16,'Mais 1 volta'), (14, 6,'2018-05-27', 17,'Mais 2 voltas'), (9, 6,'2018-05-27', 18,'Não concluiu'), (17, 6,'2018-05-27', 19,'Não concluiu'), (7, 6,'2018-05-27', 20,'Não concluiu'),

(3, 7,'2018-06-10', 1,'1:28:31.377'), (4, 7,'2018-06-10', 2,'+7.376 s'), (2, 7,'2018-06-10', 3,'+8;360 s'), (6, 7,'2018-06-10', 4,'+20.892  s'), (1, 7,'2018-06-10', 5,'+21.559 s'),
(5, 7,'2018-06-10', 6,'+27.184 s'), (10, 7,'2018-06-10', 7,'Mais 1 volta'), (8, 7,'2018-06-10', 8,'Mais 1 volta'), (20, 7,'2018-06-10', 9,'Mais 1 volta'), (9, 7,'2018-06-10', 10,'Mais 1 volta'),
(13, 7,'2018-06-10', 11,'Mais 1 volta'), (15, 7,'2018-06-10', 12,'Mais 1 volta'), (18, 7,'2018-06-10', 13,'Mais 1 volta'), (16, 7,'2018-06-10', 14,'Mais 1 volta'), (11, 7,'2018-06-10', 15,'Mais 2 voltas'),
(12, 7,'2018-06-10', 16,'Mais 2 voltas'), (19, 7,'2018-06-10', 17,'Mais 2 voltas'), (7, 7,'2018-06-10', 18,'Não concluiu'), (17, 7,'2018-06-10', 19,'Não concluiu'), (14, 7,'2018-06-10', 20,'Não concluiu'),

(1, 8,'2018-06-24', 1,'1:30:11.385'), (2, 8,'2018-06-24', 2,'+7.090 s'), (5, 8,'2018-06-24', 3,'+25.888 s'), (6, 8,'2018-06-24', 4,'+34.736 s'), (3, 8,'2018-06-24', 5,'+61.935 s'),
(18, 8,'2018-06-24', 6,'+79.364 s'), (4, 8,'2018-06-24', 7,'+80.632 s'), (8, 8,'2018-06-24', 8,'+87.184 s'), (10, 8,'2018-06-24', 9,'+91.989 s'), (9, 8,'2018-06-24', 10,'93.873 s'),
(15, 8,'2018-06-24', 11,'Mais 1 volta'), (12, 8,'2018-06-24', 12,'Mais 1 volta'), (11, 8,'2018-06-24', 13,'Mais 1 volta'), (17, 8,'2018-06-24', 14,'Mais 1 volta'), (19, 8,'2018-06-24', 15,'Mais 1 volta'),
(7, 8,'2018-06-24', 16,'Não concluiu'), (14, 8,'2018-06-24', 17,'Não concluiu'), (16, 8,'2018-06-24', 18,'Não concluiu'), (20, 8,'2018-06-24', 19,'Não concluiu'), (13, 8,'2018-06-24', 20,'Não concluiu'),

(2, 9,'2018-07-01', 1,'1:21:56.024'), (5, 9,'2018-07-01', 2,'+1.504 s'), (3, 9,'2018-07-01', 3,'+3.181 s'), (15, 9,'2018-07-01', 4,'Mais 1 volta'), (18, 9,'2018-07-01', 5,'Mais 1 volta'),
(20, 9,'2018-07-01', 6,'Mais 1 volta'), (16, 9,'2018-07-01', 7,'Mais 1 volta'), (7, 9,'2018-07-01', 8,'Mais 1 volta'), (14, 9,'2018-07-01', 9,'Mais 1 volta'), (11, 9,'2018-07-01', 10,'Mais 1 volta'),
(13, 9,'2018-07-01', 11,'Mais 1 volta'), (8, 9,'2018-07-01', 12,'Mais 1 volta'), (19, 9,'2018-07-01', 13,'Mais 2 voltas'), (14, 9,'2018-07-01', 14,'Mais 2 voltas'), (12, 9,'2018-07-01', 15,'Não concluiu'),
(1, 9,'2018-07-01', 16,'Não concluiu'), (17, 9,'2018-07-01', 17,'Não concluiu'), (6, 9,'2018-07-01', 18,'Não concluiu'), (4, 9,'2018-07-01', 19,'Não concluiu'), (10, 9,'2018-07-01', 20,'Não concluiu'),

(3, 10,'2018-07-08', 1,'1:27:29.784'), (1, 10,'2018-07-08', 2,'+2.264 s'), (5, 10,'2018-07-08', 3,'+3.652 s'), (4, 10,'2018-07-08', 4,'+8.883 s'), (6, 10,'2018-07-08', 5,'+9.500 s'),
(10, 10,'2018-07-08', 6,'+28.220 s'), (20, 10,'2018-07-08', 7,'+29.930 s'), (7, 10,'2018-07-08', 8,'+31.115 s'), (18, 10,'2018-07-08', 9,'+33.188 s'), (16, 10,'2018-07-08', 10,'+34.108 s'),
(12, 10,'2018-07-08', 11,'35.774 s'), (14, 10,'2018-07-08', 12,'+38.106 s'), (13, 10,'2018-07-08', 13,'+39.129 s'), (19, 10,'2018-07-08', 14,'+48.113 s'), (2, 10,'2018-07-08', 15,'Não concluiu'),
(15, 10,'2018-07-08', 16,'Não concluiu'), (8, 10,'2018-07-08', 17,'Não concluiu'), (11, 10,'2018-07-08', 18,'Não concluiu'), (9, 10,'2018-07-08', 19,'Não concluiu'), (17, 10,'2018-07-08', 20,'Não concluiu'),

(1, 11,'2018-07-22', 1,'1:32:29.845'), (4, 11,'2018-07-22', 2,'+4.535 s'), (5, 11,'2018-07-22', 3,'+6.732 s'), (2, 11,'2018-07-22', 4,'+7.654 s'), (10, 11,'2018-07-22', 5,'+26.609 s'),
(15, 11,'2018-07-22', 6,'+28.871 s'), (16, 11,'2018-07-22', 7,'+30.556 s'), (20, 11,'2018-07-22', 8,'+31.750 s'), (11, 11,'2018-07-22', 9,'+32.362 s'), (17, 11,'2018-07-22', 10,'+34.197 s'),
(18, 11,'2018-07-22', 11,'+34.919 s'), (8, 11,'2018-07-22', 12,'+43.069 s'), (12, 11,'2018-07-22', 13,'+46.617 s'), (13, 11,'2018-07-22', 14,'Mais 1 volta'), (9, 11,'2018-07-22', 15,'Mais 1 volta'),
(7, 11,'2018-07-22', 16,'Não concluiu'), (14, 11,'2018-07-22', 17,'Não concluiu'), (3, 11,'2018-07-22', 18,'Não concluiu'), (19, 11,'2018-07-22', 19,'Não concluiu'), (6, 11,'2018-07-22', 20,'Não concluiu'),

(1, 12,'2018-07-29', 1,'1:37:16.427'), (3, 12,'2018-07-29', 2,'+17.123 s'), (5, 12,'2018-07-29', 3,'+20.101 s'), (6, 12,'2018-07-29', 4,'+46.419 s'), (4, 12,'2018-07-29', 5,'+60.000 s'),
(13, 12,'2018-07-29', 6,'+73.273 s'), (18, 12,'2018-07-29', 7,'Mais 1 volta'), (7, 12,'2018-07-29', 8,'Mais 1 volta'), (8, 12,'2018-07-29', 9,'Mais 1 volta'), (15, 12,'2018-07-29', 10,'Mais 1 volta'),
(17, 12,'2018-07-29', 11,'Mais 1 volta'), (10, 12,'2018-07-29', 12,'Mais 1 volta'), (20, 12,'2018-07-29', 13,'Mais 1 volta'), (16, 12,'2018-07-29', 14,'Mais 1 volta'), (11, 12,'2018-07-29', 15,'Mais 2 voltas'),
(19, 12,'2018-07-29', 16,'Mais 2 voltas'), (14, 12,'2018-07-29', 17,'Mais 2 voltas'), (12, 12,'2018-07-29', 18,'Não concluiu'), (2, 12,'2018-07-29', 19,'Não concluiu'), (9, 12,'2018-07-29', 20,'Não concluiu'),

(3, 13,'2018-08-26', 1,'1:23:34.476'), (1, 13,'2018-08-26', 2,'+11.061 s'), (2, 13,'2018-08-26', 3,'+31.372 s'), (4, 13,'2018-08-26', 4,'+68.605 s'), (16, 13,'2018-08-26', 5,'+71.023 s'),
(20, 13,'2018-08-26', 6,'+79.520 s'), (15, 13,'2018-08-26', 7,'+85.953 s'), (11, 13,'2018-08-26', 8,'87.639 s'), (13, 13,'2018-08-26', 9,'+105.892 s'), (11, 13,'2018-08-26', 10,'Mais 1 volta'),
(8, 13,'2018-08-26', 11,'Mais 1 volta'), (19, 13,'2018-08-26', 12,'Mais 1 volta'), (14, 13,'2018-08-26', 13,'Mais 1 volta'), (17, 13,'2018-08-26', 14,'Mais 1 volta'), (12, 13,'2018-08-26', 15,'Mais 1 volta'),
(6, 13,'2018-08-26', 16,'Não concluiu'), (5, 13,'2018-08-26', 17,'Não concluiu'), (9, 13,'2018-08-26', 18,'Não concluiu'), (7, 13,'2018-08-26', 19,'Não concluiu'), (10, 13,'2018-08-26', 20,'Não concluiu'),

(1, 14,'2018-09-02', 1,'1:16:54.484'), (5, 14,'2018-09-02', 2,'+8.705 s'), (4, 14,'2018-09-02', 3,'+14.066 s'), (3, 14,'2018-09-02', 4,'+16.151 s'), (2, 14,'2018-09-02', 5,'+18.208 s'),
(20, 14,'2018-09-02', 6,'+57.761 s'), (16, 14,'2018-09-02', 7,'+58.678 s'), (8, 14,'2018-09-02', 8,'+78.140 s'), (14, 14,'2018-09-02', 9,'Mais 1 volta'), (19, 14,'2018-09-02', 10,'Mais 1 volta'),
(9, 14,'2018-09-02', 11,'Mais 1 volta'), (12, 14,'2018-09-02', 12,'Mais 1 volta'), (10, 14,'2018-09-02', 13,'Mais 1 volta'), (13, 14,'2018-09-02', 14,'Mais 1 volta'), (11, 14,'2018-09-02', 15,'Mais 1 volta'),
(18, 14,'2018-09-02', 16,'Mais 1 volta'), (6, 14,'2018-09-02', 17,'Não concluiu'), (7, 14,'2018-09-02', 18,'Não concluiu'), (17, 14,'2018-09-02', 19,'Não concluiu'), (15, 14,'2018-09-02', 20,'Não concluiu'),

(1, 15,'2018-09-16', 1,'1:51:11.611'), (2, 15,'2018-09-16', 2,'+8.961 s'), (3, 15,'2018-09-16', 3,'+39.945 s'), (4, 15,'2018-09-16', 4,'+51.930 s'), (5, 15,'2018-09-16', 5,'+53.001 s'),
(6, 15,'2018-09-16', 6,'+53.982 s'), (7, 15,'2018-09-16', 7,'+103.011 s'), (8, 15,'2018-09-16', 8,'Mais 1 volta'), (9, 15,'2018-09-16', 9,'Mais 1 volta'), (10, 15,'2018-09-16', 10,'Mais 1 volta'),
(11, 15,'2018-09-16', 11,'Mais 1 volta'), (12, 15,'2018-09-16', 12,'Mais 1 volta'), (13, 15,'2018-09-16', 13,'Mais 1 volta'), (14, 15,'2018-09-16', 14,'Mais 1 volta'), (15, 15,'2018-09-16', 15,'Mais 1 volta'),
(16, 15,'2018-09-16', 16,'Mais 1 volta'), (17, 15,'2018-09-16', 17,'Mais 1 volta'), (18, 15,'2018-09-16', 18,'Mais 2 voltas'), (19, 15,'2018-09-16', 19,'Mais 2 voltas'), (20, 15,'2018-09-16', 20,'Não concluiu');


SELECT * FROM paises;
SELECT * FROM equipes;
SELECT * FROM pilotos;
SELECT * FROM circuitos;
SELECT * FROM corridas;
SELECT * FROM posicoes;
SELECT * FROM pilotos_corridas;

SELECT pilotos.nome as Piloto, equipes.nome as Equipe, pilotos_corridas.id_posicao as Posição, posicoes.pontos as Pontuação, pilotos_corridas.tempo as Tempo_de_conclusão, corridas.descricao as GP, circuitos.nome as Circuito, circuitos.id_pais as País
FROM ((((pilotos_corridas INNER JOIN corridas ON pilotos_corridas.id_corrida=corridas.id)
 INNER JOIN pilotos ON pilotos_corridas.id_piloto=pilotos.id)
 INNER JOIN equipes ON pilotos.id_equipe=equipes.id)
 INNER JOIN posicoes ON pilotos_corridas.id_posicao=posicoes.id)
 INNER JOIN circuitos ON corridas.id_circuito=circuitos.id
 ORDER BY pilotos_corridas.id_corrida, pilotos_corridas.id_posicao;

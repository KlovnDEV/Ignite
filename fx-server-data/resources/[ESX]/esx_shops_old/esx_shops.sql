USE `essentialmode`;

CREATE TABLE `shops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`store` varchar(100) NOT NULL,
	`item` varchar(100) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `shops` (store, item, price) VALUES
	('TwentyFourSeven','bandage',30),
	('TwentyFourSeven','carotool',30),
	('TwentyFourSeven','water',30)
	('TwentyFourSeven','powerade',30)
	
;
DROP DATABASE IF EXISTS `test`;

CREATE DATABASE `test`
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE `test`;

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  `createdDate` DATETIME NOT NULL DEFAULT NOW(),
  `done` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`)
);

INSERT INTO `note`(`title`, `text`)
VALUES ('Купить', 'Хлеб, молоко, масло'),
       ('Почта', 'Ответить Бобу'),
       ('Поздравить', 'В 21:00 поздравить Олега с ДР'),
       ('Ксерокопии', 'Паспорт, полис');
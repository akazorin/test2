CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `count_authors` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count_readers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

ALTER TABLE books ADD INDEX (count_authors);
ALTER TABLE books ADD INDEX (count_readers);

INSERT INTO `books` (name, created) VALUES ('Книга 1', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 2', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 3', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 4', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 5', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 6', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 7', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 8', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 9', NULL);
INSERT INTO `books` (name, created) VALUES ('Книга 10', NULL);

CREATE TABLE `authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `created` timestamp DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

INSERT INTO `authors` (name, created) VALUES ('Автор 1', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 2', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 3', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 4', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 5', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 6', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 7', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 8', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 9', NULL);
INSERT INTO `authors` (name, created) VALUES ('Автор 10', NULL);

CREATE TABLE `readers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `created` timestamp DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

INSERT INTO `readers` (name, created) VALUES ('Читатель 1', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 2', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 3', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 4', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 5', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 6', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 7', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 8', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 9', NULL);
INSERT INTO `readers` (name, created) VALUES ('Читатель 10', NULL);

CREATE TABLE IF NOT EXISTS `reader_books` (
  `reader_id` int(11) unsigned NOT NULL,
  `book_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `reader_books` (reader_id, book_id) VALUES (1, 1);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (4, 6);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (7, 4);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (2, 9);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (5, 3);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (1, 7);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (5, 9);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (4, 7);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (8, 3);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (6, 2);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (3, 9);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (3, 5);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (1, 8);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (3, 7);
INSERT INTO `reader_books` (reader_id, book_id) VALUES (4, 8);

CREATE TABLE IF NOT EXISTS `book_authors` (
  `book_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE book_authors ADD INDEX (book_id);

INSERT INTO `book_authors` (book_id, author_id) VALUES (1, 1);
INSERT INTO `book_authors` (book_id, author_id) VALUES (4, 6);
INSERT INTO `book_authors` (book_id, author_id) VALUES (7, 4);
INSERT INTO `book_authors` (book_id, author_id) VALUES (2, 9);
INSERT INTO `book_authors` (book_id, author_id) VALUES (5, 3);
INSERT INTO `book_authors` (book_id, author_id) VALUES (1, 7);
INSERT INTO `book_authors` (book_id, author_id) VALUES (5, 9);
INSERT INTO `book_authors` (book_id, author_id) VALUES (4, 7);
INSERT INTO `book_authors` (book_id, author_id) VALUES (8, 3);
INSERT INTO `book_authors` (book_id, author_id) VALUES (6, 2);
INSERT INTO `book_authors` (book_id, author_id) VALUES (3, 9);
INSERT INTO `book_authors` (book_id, author_id) VALUES (3, 5);
INSERT INTO `book_authors` (book_id, author_id) VALUES (1, 8);
INSERT INTO `book_authors` (book_id, author_id) VALUES (3, 7);
INSERT INTO `book_authors` (book_id, author_id) VALUES (4, 8);

update books set count_authors = (SELECT COUNT(*) FROM book_authors WHERE book_id = books.id);
update books set count_readers = (SELECT COUNT(*) FROM reader_books WHERE book_id = books.id);

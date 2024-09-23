-- -------------------------------------------------------------
-- TablePlus 6.1.6(570)
--
-- https://tableplus.com/
--
-- Database: library_management_system
-- Generation Time: 2024-09-23 10:19:19.2120
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `Authors` (
  `author_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Books` (
  `book_id` int NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_author` (`author_id`),
  CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Loans` (
  `loan_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `fk_book` (`book_id`),
  KEY `fk_member` (`member_id`),
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`),
  CONSTRAINT `fk_member` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Members` (
  `member_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Authors` (`author_id`, `name`, `nationality`) VALUES
(1, 'George Orwell', 'British');

INSERT INTO `Books` (`book_id`, `title`, `author_id`, `genre`, `publish_date`) VALUES
(1, '1984', 1, 'Science Fiction', '1949-06-08');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
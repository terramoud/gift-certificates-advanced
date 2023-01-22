-- -----------------------------------------------------
-- Schema gift_certificates
-- -----------------------------------------------------
DROP DATABASE IF EXISTS gift_certificates;
CREATE DATABASE IF NOT EXISTS gift_certificates DEFAULT CHARACTER SET utf8;
USE gift_certificates;


-- -----------------------------------------------------
-- Table certificate
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS certificates
(
    PRIMARY KEY (id),
    id               INT           NOT NULL AUTO_INCREMENT,
    name             VARCHAR(32)   NOT NULL UNIQUE,
    description      VARCHAR(256)  NOT NULL,
    price            DECIMAL(9, 2) NOT NULL,
    duration         INT UNSIGNED  NOT NULL,
    create_date      DATETIME      NOT NULL,
    last_update_date DATETIME      NOT NULL
);

CREATE TRIGGER do_immutable_create_date
    BEFORE UPDATE
    ON certificates
    FOR EACH ROW
BEGIN
    SET NEW.create_date = OLD.create_date;
END;


-- -----------------------------------------------------
-- Table tag
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tags
(
    PRIMARY KEY (id),
    id   INT         NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL UNIQUE
);


-- -----------------------------------------------------
-- Table certificates_tags
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS certificates_tags
(
    certificate_id INT NOT NULL,
    tag_id         INT NOT NULL,
    FOREIGN KEY (certificate_id)
        REFERENCES certificates (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tag_id)
        REFERENCES tags (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- fill certificate
-- -----------------------------------------------------
INSERT INTO certificates
VALUES (DEFAULT, 'standard', 'standard level gift certificate', 999.99, 180, '2023-01-02T07:37:14.974',
        '2023-01-02T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'standard plus', 'standard plus level gift certificate', 699.99, 120, '2023-01-03T07:37:14.974',
        '2023-01-03T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'standard extra', 'standard extra level gift certificate', 1099.99, 120, '2023-01-04T07:37:14.974',
        '2023-01-04T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'VIP', 'VIP level gift certificate', 1099.99, 120, '2023-01-05T07:37:14.974',
        '2023-01-05T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'base', 'base level gift certificate', 1099.99, 120, '2023-01-06T07:37:14.974',
        '2023-01-06T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'premium', 'premium level gift certificate', 1099.99, 120, '2023-01-07T07:37:14.974',
        '2023-01-07T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'gold', 'gold level gift certificate', 1099.99, 120, '2023-01-08T07:37:14.974',
        '2023-01-08T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'platinum', 'platinum level gift certificate', 1099.99, 120, '2023-01-09T07:37:14.974',
        '2023-01-09T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'New Year edition', 'New Year edition gift certificate', 1099.99, 120, '2023-01-01T07:37:14.974',
        '2023-01-01T07:37:14.974');
INSERT INTO certificates
VALUES (DEFAULT, 'some certificate', 'some certificate for some days', 1099.99, 120, '2023-01-10T07:37:14.974',
        '2023-01-10T07:37:14.974');

-- -----------------------------------------------------
-- fill tag
-- -----------------------------------------------------
INSERT INTO tags
VALUES (DEFAULT, 'language courses');
INSERT INTO tags
VALUES (DEFAULT, 'dancing courses');
INSERT INTO tags
VALUES (DEFAULT, 'diving courses');
INSERT INTO tags
VALUES (DEFAULT, 'martial arts courses');
INSERT INTO tags
VALUES (DEFAULT, 'driving courses');
INSERT INTO tags
VALUES (DEFAULT, 'drawing courses');
INSERT INTO tags
VALUES (DEFAULT, 'fighting courses');
INSERT INTO tags
VALUES (DEFAULT, 'yoga courses');
INSERT INTO tags
VALUES (DEFAULT, 'airplane flying courses');
INSERT INTO tags
VALUES (DEFAULT, 'other courses');
INSERT INTO tags
VALUES (DEFAULT, 'swimming courses');
INSERT INTO tags
VALUES (DEFAULT, 'survive courses');
INSERT INTO tags
VALUES (DEFAULT, 'math courses');
INSERT INTO tags
VALUES (DEFAULT, 'hunting courses');

-- -----------------------------------------------------
-- fill certificates_tags
-- -----------------------------------------------------
INSERT INTO certificates_tags VALUES (1, 1);
INSERT INTO certificates_tags VALUES (1, 2);
INSERT INTO certificates_tags VALUES (1, 7);
INSERT INTO certificates_tags VALUES (1, 3);
INSERT INTO certificates_tags VALUES (1, 4);
INSERT INTO certificates_tags VALUES (1, 5);
INSERT INTO certificates_tags VALUES (1, 6);
INSERT INTO certificates_tags VALUES (2, 1);
INSERT INTO certificates_tags VALUES (2, 2);
INSERT INTO certificates_tags VALUES (2, 3);
INSERT INTO certificates_tags VALUES (2, 7);
INSERT INTO certificates_tags VALUES (2, 8);
INSERT INTO certificates_tags VALUES (2, 9);
INSERT INTO certificates_tags VALUES (3, 13);
INSERT INTO certificates_tags VALUES (3, 12);
INSERT INTO certificates_tags VALUES (3, 11);
INSERT INTO certificates_tags VALUES (3, 10);
INSERT INTO certificates_tags VALUES (3, 9);
INSERT INTO certificates_tags VALUES (3, 8);
INSERT INTO certificates_tags VALUES (4, 2);
INSERT INTO certificates_tags VALUES (4, 3);
INSERT INTO certificates_tags VALUES (4, 4);
INSERT INTO certificates_tags VALUES (4, 5);
INSERT INTO certificates_tags VALUES (4, 6);
INSERT INTO certificates_tags VALUES (5, 1);
INSERT INTO certificates_tags VALUES (5, 2);
INSERT INTO certificates_tags VALUES (5, 4);
INSERT INTO certificates_tags VALUES (5, 6);
INSERT INTO certificates_tags VALUES (5, 8);
INSERT INTO certificates_tags VALUES (5, 10);
INSERT INTO certificates_tags VALUES (5, 12);
INSERT INTO certificates_tags VALUES (3, 2);
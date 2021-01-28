CREATE DATABASE wordpress;
CREATE USER 'eh'@'localhost' IDENTIFIED BY 'eh';
GRANT ALL ON wordpress.* TO 'eh'@'localhost';
FLUSH PRIVILEGES;

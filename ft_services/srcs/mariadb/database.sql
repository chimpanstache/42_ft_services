CREATE DATABASE wordpress;
CREATE USER 'eh'@'%' IDENTIFIED BY 'eh';
GRANT ALL PRIVILEGES ON *.* TO 'eh'@'%' IDENTIFIED BY 'eh' WITH GRANT OPTION;
FLUSH PRIVILEGES;
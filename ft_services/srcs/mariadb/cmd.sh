
mysql_install_db --user=root --ldata=/var/lib/mysql
mysqld --user=root --bootstrap < /setup/database.sql
#bind adres 0000 accpete requetes e n'importe quel ips 
# --console keeps the console window open
# --console keeps the console window open
# --skip-networking=0 enable the server to listen to TCP/IP connections
# --port=3306 default port to listen to TCP-IP connections
# --datadir= directory where the data is stored

mysqld --user=root --console --skip-networking=0 --port=3306 --datadir=/var/lib/mysql --bind-address=0.0.0.0
set -eux

sudo cp s1/etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo cp s1/etc/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp s1/etc/nginx/sites-available/isucari.conf /etc/nginx/sites-available/isucari.conf

sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart mysql

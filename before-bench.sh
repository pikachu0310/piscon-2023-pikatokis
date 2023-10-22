set -eux

cd ~/isucari && git pull
cd ~/isucari/webapp/go && make isucari && sudo systemctl restart isucari.golang.service
sudo pt-query-digest /var/log/mysql/mysql-slow.log > ~/isucari/log/$(date +mysql-slow.log-%m-%d-%H-%M -d "+9 hours") && sudo rm /var/log/mysql/mysql-slow.log && sudo systemctl restart mysql
sudo cat /var/log/nginx/access.log | alp ltsv -m "/users/\d+.json","/items/\d+.json","/new_items/\d+.json","/upload/.+.jpg","/transactions/\d+.png" --sort sum -r > ~/isucari/log/$(date +access.log-%m-%d-%H-%M -d "+9 hours") && sudo rm /var/log/nginx/access.log && sudo nginx -t && sudo systemctl reload nginx

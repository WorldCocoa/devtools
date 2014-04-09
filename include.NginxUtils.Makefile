host-nginx-setup-app:
	sudo apt-get install -y nginx
	sudo cp ./scripts/app.conf /etc/init/nginx/sites-available/app.conf
	-sudo rm /etc/init/nginx/sites-enabled/default 
	sudo ln -s /etc/init/nginx/sites-available/app.conf /etc/init/nginx/sites-enabled/app.conf
	sudo service nginx restart

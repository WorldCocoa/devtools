host-nginx-setup-app:
	sudo apt-get install -y nginx
	sudo cp scripts/app.conf /etc/nginx/sites-available/app.conf
	-sudo rm /etc/nginx/sites-enabled/default 
	sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
	sudo service nginx restart

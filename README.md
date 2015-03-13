# palladium
https://gorails.com/setup/ubuntu/14.10<br>
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"<br>
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -<br>
sudo apt-get update<br>
sudo apt-get install postgresql-common<br>
sudo apt-get install postgresql-9.3 libpq-dev<br>
sudo -u postgres createuser chris -s # Feel free to replace chris with your username.<br>
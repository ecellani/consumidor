#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2 apache2-utils
sudo apt-get -y install php php-pgsql libapache2-mod-php
sudo service httpd start
sudo chkconfig httpd on
sudo touch /var/www/html/tryme.php

sudo echo "<?php" >> /var/www/html/tryme.php
sudo echo "\$db_connection = pg_connect(\"host=rds-base-a.c05f1vj6awmt.us-east-1.rds.amazonaws.com dbname=baseA user=root password=A1B2c3d4E5\");" >> /var/www/html/tryme.php
sudo echo "\$result = pg_query(\$db_connection, \"select sysdate from dual\");" >> /var/www/html/tryme.php
sudo echo "\$echo var_dump(\$result)\");" >> /var/www/html/tryme.php
sudo echo "?>" >> /var/www/html/tryme.php

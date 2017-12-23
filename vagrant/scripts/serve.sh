#!/usr/bin/env bash

# $1 = skeleton file name - currently only apache.default or nginx.default
# $2 = server name e.g. zen.local
# $3 = working directory -- ie: the localized path to the repo files
# $4 = document root -- blank or add "/public" if working with a framework like laravel or symfony
# $5 = Git repository - can be null
# $6 = git branch - can be null

INPUT_FILE=/home/vagrant/scripts/skeletons/$1
OUTPUT_FILE=/home/vagrant/$2
echo "Skeleton = $INPUT_FILE"
echo "Server conf = $OUTPUT_FILE"
echo "Working Dir = $3"
echo "Document Root = $4"
echo "Git Repository = $5"
echo "Git Branch = $6"

# make project working-dir folder if not present
if [ ! -d "/home/vagrant/web/$3" ]; then
  sudo mkdir -pv /home/vagrant/web/$3
fi

# create and enable vhost
sed "s/SERVER_NAME/$2/g;s|DOCUMENT_ROOT|$3$4|g" $INPUT_FILE > $OUTPUT_FILE

if [[ "$1" =~ nginx.* ]]; then
  sudo mv $OUTPUT_FILE /etc/nginx/sites-available/$2
  ln -s "/etc/nginx/sites-available/$2" "/etc/nginx/sites-enabled/$2"
  sudo service nginx restart
  sudo service php5-fpm restart > /dev/null 2>&1
else
  sudo mv $OUTPUT_FILE /etc/apache2/sites-available/$2.conf
  sudo a2ensite $2.conf -q
  sudo service apache2 restart
fi

# do any repo checkouts necessary
if [ ! -z "$5" ]; then

  # do clone only if directory is empty
  if [ ! "$(ls -A /home/vagrant/web/$3 )" ]; then
    sudo git clone -q $5 /home/vagrant/web/$3
    # and checkout the specified branch
    cd /home/vagrant/web/$3
    sudo git checkout $6
    git submodule init
    git submodule update
  fi

fi

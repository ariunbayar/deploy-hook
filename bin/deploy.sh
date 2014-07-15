#!/bin/sh

# Add following line into /etc/crontab
# */5 *    * * *   root    sh /var/www/deploy/bin/deploy.sh

repo_path="/path/to/repo"
file="/var/www/deploy/deploy_requests"

lines=`wc -l $file | cut -f1 -d' '`
tail -n+2 $file > tmp.deploy
chmod 666 tmp.deploy
mv tmp.deploy $file

if [ $lines -gt 0 ]
then
    olddir=`pwd`
    cd $repo_path
    git pull
    sh lib/deploy.sh
    php lib/deploy/mailer.php
    cd $olddir
fi

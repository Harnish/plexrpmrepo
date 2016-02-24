#!/bin/bash

echo installing into $1

mkdir -p $1
cp checkplexpackage.pl $i/
cp plexrpm.crontab /etc/cron.d/
sed -i 'REPLACEWITHPATH/$1' /etc/cron.d/plexrpm.crontab
cp plexserver.repo /etc/yum.repos.d/
sed -i 'REPLACEWITHPATH/$1' /etc/yum.repos.d/plexserver.repo


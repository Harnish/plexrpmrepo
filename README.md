# plexrpmrepo
A script and such to create a local rpm repo from plex's website.

# Install
  mkdir /var/www/rpms
  cp checkplexpackage.pl /var/www/rpms
  sed -i '\/path\/to\/checkplexpackage.pl\//\/var\/www\/rpms\/' plexrpm.crontab
  cp plexrpm.crontab /etc/cron.d/
  sed -i 'path\/to\/checkplexpackage.pl\//\/var\/www\/rpms\/' plexserver.repo
  cp plexserver.repo /etc/yum.repos.d/

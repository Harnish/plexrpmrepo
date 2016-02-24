# plexrpmrepo
A script and such to create a local rpm repo from plex's website.

# Install
```
./install.pl /var/www/rpm/
```

This will install a crontab in /etc/cron.d, install a file based yum/dnf repo file in /etc/yum.repos.d/ make the destination directory, put the script in there and install createrepo if it isn't already.

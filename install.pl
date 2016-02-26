#!/usr/bin/perl

use strict;
use File::Copy;

if( -e '/usr/bin/dnf') {
    my $cmd = `dnf -y install createrepo`;
} else {
    my $cmd = `yum -y install createrepo`;
}

my $dest = shift || '';
if( $dest eq '' ){
    print "Provide an install path: $0 /foo/bar \n";
    exit;
}

print "Installing into $dest\n";
if( ! -e $dest ){
    mkdir $dest;
}

copy("checkplexpackage.pl", "$dest/checkplexpackage.pl");
my $mode = 0755;
chmod $mode, "$dest/checkplexpackage.pl";

open my $CRONTAB, ">", "plexrpm.crontab";
print $CRONTAB "0 */2 * * *  root cd $dest  && ./checkplexpackage.pl 2>&1 >/var/log/plexupdate.log";
close $CRONTAB;

open my $INREPO, "<", "plexserver.repo";
open my $OUTREPO, ">", "/etc/yum.repos.d/plexserver.repo";
while (<$INREPO>){
    $_ =~ s/REPLACEWITHPATH/$dest/g;
    print $OUTFILE "$_";
}
close $INREPO;
close $OUTREPO;


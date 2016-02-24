#!/usr/bin/perl

use strict;

my $URL = 'https://plex.tv/downloads';
my $page = `curl $URL | grep rpm | grep x86_64`;
my @lines = split(/\n/, $page);
my %packages;
foreach my $line (@lines) {
  $line =~ /href\=\"(.*rpm)\"/;
  $packages{$1} = 1;
}
foreach my $download (keys %packages) {
  my @downloadparts = split(/\//, $download);
  if (! -e $downloadparts[-1] ){
    print "Need to download $download\n";
    `wget $download`;
    `createrepo .`;
  }
}

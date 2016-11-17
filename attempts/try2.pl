#!/usr/bin/perl
use warnings;
use strict;
use URI;
use Web::Scraper;
 
open FILE, ">file" or die $!;
 
# website to scrape
my $urlToScrape = "http://www.uci.ch/road/teams/";
 
# prepare data
my $teamsdata = scraper {
 # we will save the urls from the teams
 process "table#eventListTable > tr > td > a", 'urls[]' => '@href';
 # we will save the team names
 process "table#eventListTable > tr > td > a", 'teams[]' => 'TEXT';
};
# scrape the data
my $res = $teamsdata->scrape(URI->new($urlToScrape));
 print "okay";
 print $res;
# print the second field (the teamname)
for my $i (0 .. $%{$res->{teams}}) {
 if ($i%3 != 0 && $i%3 != 2) {
 print $res->{teams}[$i];
 print "\n";
 print FILE $res->{teams}[$i];
 print FILE "\n";
 }
}
 
print FILE "\n";

 
# close the file
close FILE;

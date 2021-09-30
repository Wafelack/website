#!/usr/bin/env perl
use strict;
use warnings;

if ($#ARGV + 1 != 1) {
    print "usage: add_short.pl <name>\n";
    exit 1;
}

my @short_content = <STDIN>;
my $current_date = `date +"%d %B %Y"`;

my @formatted_content = ("<div class='short'>", 
                        "<span class='short-title'>$ARGV[0]</span>",
                        "<i class='short-date'>$current_date</i>",
                        "<p class='short-content'>",
                        join("\n", @short_content),
                        "</p>",
                        "</div>");

my $index = "index.html";
my $delimiter = "<!-- BEGIN SHORTS SECTION -->";

open (my $fp, "<$index");
my @fc = <$fp>;
close ($fp);

open($fp, ">$index");
for (@fc) {
    if ($_ =~ m/$delimiter/) {
        print $fp "$delimiter\n";
        print $fp join("\n", @formatted_content), "\n";
    } else {
        print $fp $_;
    }
}
close ($fp);

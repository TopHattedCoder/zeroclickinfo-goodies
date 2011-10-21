#!/usr/bin/perl

use strict;
use warnings;

my $q_check_lc = 'public dns';
my $answer_results = '';
my $answer_type = '';
my $type = '';

my %public_dns = (
    'public dns' => '',
    'public dns server' => '',
    'public dns servers' => '',
    'google public dns' => 'google',
    'google public dns server' => 'google',
    'google public dns servers' => 'google',
    'opendns public dns' => 'opendns',
    'opendns public dns server' => 'opendns',
    'opendns public dns servers' => 'opendns',
    'norton public dns' => 'norton',
    'norton public dns server' => 'norton',
    'norton public dns servers' => 'norton',
    'dna advantage public dns' => 'advantage',
    'dns advantage public dns server' => 'advantage',
    'dns advantage public dns servers' => 'advantage',
    );


if ($type ne 'E' && exists $public_dns{$q_check_lc}) {

    open(IN,"<publicdns.html");
    while (my $line = <IN>) {
	$answer_results .= $line;
    }
    close(IN);

    if ($answer_results) {
	$answer_type = 'dns';
	$type = 'E';
    }
}


print qq($answer_type\t$answer_results\n);

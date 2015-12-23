package Bk::trim;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK=qw(ltrim trim trim);


sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

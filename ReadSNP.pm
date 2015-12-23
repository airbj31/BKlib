package Bk::ReadSNP;

use strict;
use warnings;
use Exporter qw(import);

our %chr;
our %rsname;
our %pos;
our %strand;

our @EXPORT_OK =qw(Read_BED);

sub Read_BED()
{
	our $bedfile=shift;
	
	open IN,'<',$bedfile or die "Can't Read BED file\n";

	while(<IN>)
	{
		chomp($_);
		my @arr= split(/[\t\s]+/,$_);

		if(exists($rsname{$arr[3]}))
		{

			$rsname{$arr[3]}++;
			$chr{$arr[3]}=$chr{$arr[3]}."_".$arr[0];
			$pos{$arr[3]}=$pos{$arr[3]}."_".$arr[1];
			$strand{$arr[3]}=$strand{$arr[3]}."_".$arr[5];


		} else {

			$chr{$arr[3]}=$arr[0];
			$pos{$arr[3]}=$arr[1];
			$strand{$arr[3]}=$arr[5];
		}
	
	}
	close(IN);
}

1;


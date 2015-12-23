package Bk::FileDir;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK=qw(makeLIST chkdir chkfile);

sub makeLIST()
{

	my @listarr;

	## Read Variables
        my $LISTFILE=shift @_;
        my $vsall=shift @_;
	my $ARGV_ref;
	if($vsall == 0)
	{ 
		$ARGV_ref= shift @_;
	} else {
		$ARGV_ref=0;
	}		

        if($LISTFILE ne "")
        {
                if(-e $LISTFILE)
                {
                        open IN,'<',$LISTFILE or die "Can't open the $LISTFILE :: $!;\n";
                        while(my $line=<IN>)
                        {
                                        chomp($line);
                                        push(@listarr,$line);
                        }
			close(IN);

                } else {

                        print STDERR "Can't open the $LISTFILE :: there are no $LISTFILE found.\n";
                }
        } elsif ($LISTFILE eq "")
        {
		@listarr=@{$ARGV_ref};
        }

	if($vsall==0)
	{
        	my $tmpElement;
		for(my $i=0;$i<=$#listarr;$i++)
		{
			$tmpElement=shift @listarr;
			last if($tmpElement eq ${$ARGV_ref}[0]);
		}
	}
#	print $#listarr;
	return \@listarr

}

sub chkdir()
{
	my $dir=shift @_;
	if(-d $dir) { return 1;}
	else {return 0}
} 

sub chkfile()
{
	my $file=shift @_;
	if(-e $file) { return 1;}
	else {return 0;}
}

1;                                                                                               

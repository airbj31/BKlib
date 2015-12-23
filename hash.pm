sub MaxHash (\%) {
    my $hash = shift;
    keys %$hash;       # reset the each iterator

    my ($large_key, $large_val) = each %$hash;

    while (my ($key, $val) = each %$hash) {
        if ($val > $large_val) {
            $large_val = $val;
            $large_key = $key;
        }
    }
    return $large_key
}


## MinHash;
sub MinHash (\%) {
	my $hash =shift;
	keys $hash;	# reset the each iterator
	
	my ($large_key, $large_Val) = each %$hash;

	while(my ($key,$val) = each %$hash) {
		if($val < $large_Val) {
		$large_val = $val;
		$large_key = $key;

		}
	}
}

#!/usr/bin/env perl
# hook to copy a skel directory into an empty directory created by an addon domain
# credits:
# got some of this here: https://gist.github.com/cpCharlesBoyd/5196811
# got some of this from here: http://perlmeme.org/faqs/system/rcopy.html
# To do: 
# Make this script not overwrite existing files. 

package SkelAddonModule;

use warnings;
use strict;
use File::NCopy;

sub describe {
	my $create_addon_hook = 
		{
			'category' => 'Cpanel',
			'event' => 'Api2::AddonDomain::addaddondomain',
			'stage' => 'post', 
			'hook' => 'SkelAddonModule::add_addon_domain',
			'exectype' => 'module',
		};
	return [$create_addon_hook];
}

sub your_addon_hook {
	my ( $context, $data ) = @_;
	my $args = $data->{'args'};
	my ( $target_dir, $newdomain, $subdomain ) = ( $args->{'target_dir'}, $args->{'newdomain'}, $args->{'subdomain'} );

    my $source_dir  = '/path/to/skel';

    my $cp = File::NCopy->new(recursive => 1);
    $cp->copy("$source_dir/*", $target_dir) 
        or die "Could not perform rcopy of $source_dir to $target_dir: $!";
}



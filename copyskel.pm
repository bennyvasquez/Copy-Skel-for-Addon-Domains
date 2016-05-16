#!/usr/bin/env perl

package SkelAddonModule;

use warnings;
use strict;

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
	[ insert code to copy files from skel to users new directory]
}
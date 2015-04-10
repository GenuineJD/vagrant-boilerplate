class app::apache {

	# this app module requires the 'apache' puppet modules and all dependencies

	# declare the apache module and tell it not to create the default vhost
	class { '::apache': 
		default_vhost => false,
		user => 'vagrant',
		group => 'vagrant',
	}

	# configure the vhost
	apache::vhost { 'vagrant.dev':
		docroot_owner => 'vagrant',
		docroot_group => 'vagrant',
		port => '80',
		docroot => '/var/www',
		directories => [
			{ 
				path => '/var/www',
				options => ['Indexes','FollowSymLinks'],
				allow_override => 'All'
			}
		]
	}
	
}
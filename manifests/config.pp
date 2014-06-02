# == Class php_fcgi::config
#
# This class is called from php_fcgi
#
define php_fcgi::config(
	$bind 			= $name,
	$user 			= 'www_data',
	$php_fcgi_children 	= '1',
	$php_fcgi_max_requests 	= '100',		
) {
		
	php_fcgi::service {"php_fcgi_${bind}": }

   	file { "/etc/init.d/php_fcgi_${bind}":
		ensure 	 => present,
		mode	 => 0755,
		owner    => root,
		group    => root,
		content  => template("php_fcgi/php_fcgi.erb"),
		require  => Package[$php_fcgi::package_name],
		notify   => Php_fcgi::Service["php_fcgi_${bind}"]
	}
}

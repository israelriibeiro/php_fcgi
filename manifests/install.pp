# == Class php_fcgi::install
#
class php_fcgi::install {
  package { $php_fcgi::package_name:
    ensure => installed,
  }
}

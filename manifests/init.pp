# == Class: php_fcgi
#
# Full description of class php_fcgi here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class php_fcgi (
  $package_name = $php_fcgi::package_name
) inherits php_fcgi::params {

  class { 'php_fcgi::install': }

}

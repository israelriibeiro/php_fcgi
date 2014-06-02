# == Class php_fcgi::params
#
# This class is meant to be called from php_fcgi
# It sets variables according to platform
#
class php_fcgi::params {
  case $::osfamily {
    'Debian': {
      $package_name = ["php5-cgi","php5-cli","spawn-fcgi"]
      $service_name = 'php_fcgi'
    }
    'RedHat', 'Amazon': {
      $package_name = 'php_fcgi'
      $service_name = 'php_fcgi'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

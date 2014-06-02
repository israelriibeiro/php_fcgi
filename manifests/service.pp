# == Class php_fcgi::service
#
# This class is meant to be called from php_fcgi
# It ensure the service is running
#
define php_fcgi::service (
) {

  service { $name:
    ensure     => "running",
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

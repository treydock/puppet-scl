# == Class: scl::ruby193
#
# Full description of class scl here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { scl: }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl::ruby193 (
$collection_name      = 'scl_ruby193',
$repo_descr           = $scl::params::collections['scl_ruby193']['repo_descr'],
$repo_baseurl         = $scl::params::collections['scl_ruby193']['repo_baseurl'],
$repo_failovermethod  = $scl::params::collections['scl_ruby193']['repo_failovermethod'],
$repo_enabled         = $scl::params::collections['scl_ruby193']['repo_enabled'],
$repo_gpgcheck        = $scl::params::collections['scl_ruby193']['repo_gpgcheck']
) inherits scl::params {

  $min_os_release_ver = $scl::params::collections['scl_ruby193']['min_os_release_ver']

  if versioncmp("${::operatingsystemrelease}", $min_os_release_ver) < 0 {
    fail("Unsupported operatingsystemrelease: ${::operatingsystemrelease}, scl collection ruby193 only support operatingsystemrelease >= ${min_os_release_ver}")
  }

  scl::collection { $collection_name:
    repo_descr          => $repo_descr,
    repo_baseurl        => $repo_baseurl,
    repo_failovermethod => $repo_failovermethod,
    repo_enabled        => $repo_enabled,
    repo_gpgcheck       => $repo_gpgcheck,
  }

}

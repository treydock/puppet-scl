# == Define: scl::collection
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
define scl::collection (
  $repo_descr           = 'UNSET',
  $repo_baseurl         = 'UNSET',
  $repo_failovermethod  = 'UNSET',
  $repo_enabled         = 'UNSET',
  $repo_gpgcheck        = 'UNSET'
) {

  include scl::params

  $collections = $scl::params::collections
  $collection_names = keys($collections)

  if member($collection_names, $name) {
    $collection_info = $collections[$name]
  } else {
    $collection_info = {
      'repo_descr'          => undef,
      'repo_baseurl'        => undef,
      'repo_failovermethod' => undef,
      'repo_enabled'        => undef,
      'repo_gpgcheck'       => undef,
    }
  }

  $repo_descr_real = $repo_descr ? {
    'UNSET' => $collection_info['repo_descr'],
    default => $repo_descr,
  }
  $repo_baseurl_real = $repo_baseurl ? {
    'UNSET' => $collection_info['repo_baseurl'],
    default => $repo_baseurl,
  }
  $repo_failovermethod_real = $repo_failovermethod ? {
    'UNSET' => $collection_info['repo_failovermethod'],
    default => $repo_failovermethod,
  }
  $repo_enabled_real = $repo_enabled ? {
    'UNSET' => $collection_info['repo_enabled'],
    default => $repo_enabled,
  }
  $repo_gpgcheck_real = $repo_gpgcheck ? {
    'UNSET' => $collection_info['repo_gpgcheck'],
    default => $repo_gpgcheck,
  }

  yumrepo { $name:
    descr           => $repo_descr_real,
    baseurl         => $repo_baseurl_real,
    failovermethod  => $repo_failovermethod_real,
    enabled         => $repo_enabled_real,
    gpgcheck        => $repo_gpgcheck_real,
  }

}

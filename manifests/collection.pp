# == Define: scl::collection
#
# Defines a SCL collection.
#
# Builtin collections have their defaults defined by $scl::params::collections
#
# === Parameters
#
# [*repo_name*]
#   String.  yumrepo name  attribute
#
# [*repo_descr*]
#   String.  yumrepo descr attribute
#
# [*repo_baseurl*]
#   String.  yumrepo baseurl attribute
#
# [*repo_failovermethod*]
#   String.  yumrepo failovermethod attribute
#
# [*repo_enabled*]
#   String.  yumrepo enabled attribute
#
# [*repo_gpgcheck*]
#   String.  yumrepo gpgcheck attribute
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
  $repo_name            = 'UNSET',
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
      'repo_name'           => $name,
      'repo_descr'          => undef,
      'repo_baseurl'        => undef,
      'repo_failovermethod' => undef,
      'repo_enabled'        => undef,
      'repo_gpgcheck'       => undef,
      'min_os_release_ver'  => undef,
    }
  }

  $min_os_release_ver = $collection_info['min_os_release_ver']

  if $min_os_release_ver and versioncmp("${::operatingsystemrelease}", $min_os_release_ver) < 0 {
    fail("Unsupported operatingsystemrelease: ${::operatingsystemrelease}, scl collection ${name} only supports operatingsystemrelease >= ${min_os_release_ver}")
  }

  $repo_name_real = $repo_name ? {
    'UNSET' => $collection_info['repo_name'],
    default => $repo_name,
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

  yumrepo { $repo_name_real:
    descr           => $repo_descr_real,
    baseurl         => $repo_baseurl_real,
    failovermethod  => $repo_failovermethod_real,
    enabled         => $repo_enabled_real,
    gpgcheck        => $repo_gpgcheck_real,
  }

}

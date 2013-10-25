# == Class: scl::httpd24
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl::httpd24 (
  $repo_name            = 'UNSET',
  $repo_descr           = 'UNSET',
  $repo_baseurl         = 'UNSET',
  $repo_failovermethod  = 'UNSET',
  $repo_enabled         = 'UNSET',
  $repo_gpgcheck        = 'UNSET'
) inherits scl::params {

  scl::collection { 'httpd24':
    repo_name           => $repo_name,
    repo_descr          => $repo_descr,
    repo_baseurl        => $repo_baseurl,
    repo_failovermethod => $repo_failovermethod,
    repo_enabled        => $repo_enabled,
    repo_gpgcheck       => $repo_gpgcheck,
  }

}

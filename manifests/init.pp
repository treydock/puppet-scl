# == Class: scl
#
# Installs the SCL utilities
#
# === Parameters
#
# [*package_name*]
#   String.  Name of scl-utils package
#   Default: 'scl-utils'
#
# === Examples
#
#  class { 'scl': }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl (
  $package_name = $scl::params::package_name
) inherits scl::params {

  package { 'scl-utils':
    ensure  => present,
    name    => $package_name,
  }

}

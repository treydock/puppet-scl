# == Class: scl::build
#
# Full description of class scl here.
#
# === Parameters
#
# [*package_name*]
#   String.  Name of scl-utils-build package
#   Default: 'scl-utils-build'
#
# === Examples
#
#  class { 'scl::build': }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl::build (
  $package_name = $scl::params::build_package_name
) inherits scl::params {

  package { 'scl-utils-build':
    ensure  => present,
    name    => $package_name,
  }

}

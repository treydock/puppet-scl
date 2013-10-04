# == Class: scl::params
#
# The scl configuration settings.
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
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl::params {

  $collections = {
    'scl_perl' => {
      'repo_descr'          => 'Dynamic Software Collections - Perl',
      'repo_baseurl'        => 'http://jplesnik.fedorapeople.org/repository/perl516/',
      'repo_failovermethod' => 'priority',
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'scl_ruby193' => {
      'repo_descr'          => 'Ruby 1.9.3 Dynamic Software Collection',
      'repo_baseurl'        => 'http://people.redhat.com/bkabrda/ruby193-rhel-6/',
      'repo_failovermethod' => 'priority',
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'scl_python27' => {
      'repo_descr'          => 'Python 2.7 Dynamic Software Collection',
      'repo_baseurl'        => 'http://people.redhat.com/bkabrda/python27-rhel-6/',
      'repo_failovermethod' => 'priority',
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'scl_python33' => {
      'repo_descr'          => 'Python 3.3 Dynamic Software Collection',
      'repo_baseurl'        => 'http://people.redhat.com/bkabrda/python33-rhel-6/',
      'repo_failovermethod' => 'priority',
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'php54' => {
      'repo_descr'          => 'PHP 5.4 Software Collection for RHEL',
      'repo_baseurl'        => 'http://people.redhat.com/rcollet/php54/rhel/$releasever/$basearch/',
      'repo_failovermethod' => undef,
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '5.0',
    },
    'php55' => {
      'repo_descr'          => 'PHP 5.5 Software Collection for RHEL',
      'repo_baseurl'        => 'http://people.redhat.com/rcollet/php55/rhel/$releasever/$basearch/',
      'repo_failovermethod' => undef,
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'rhel-6-scl-mariadb55' => {
      'repo_descr'          => 'rhel-6-scl-mariadb55',
      'repo_baseurl'        => 'http://people.redhat.com/~hhorak/software-collections/mariadb55-rhel-6-candidate/',
      'repo_failovermethod' => undef,
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
    'nodejs010' => {
      'repo_descr'          => 'Node.js 0.10.x Software Collection RPM repository for RHEL 6',
      'repo_baseurl'        => 'http://sochotni.fedorapeople.org/nodejs010-RHSCL-1-RHEL-6/Server/x86_64/os/',
      'repo_failovermethod' => 'priority',
      'repo_enabled'        => '1',
      'repo_gpgcheck'       => '0',
      'min_os_release_ver'  => '6.0',
    },
  }

  case $::osfamily {
    'RedHat': {
      $package_name       = 'scl-utils'
      $build_package_name = 'scl-utils-build'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
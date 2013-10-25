# puppet-scl

[![Build Status](https://travis-ci.org/treydock/puppet-scl.png)](https://travis-ci.org/treydock/puppet-scl)

## Overview

This module provides classes to enable SCL repositories.

This model only supports systems with **osfamily** RedHat.

These are the Software Collection Libraries currently provided by this module:

* **Perl 5.16** - EL6 only
* **Ruby 1.9.3** - EL6 only
* **Python 2.7** - EL6 only
* **Python 3.3** - EL6 only
* **Apache 2.4** - EL6 only
* **PHP 5.4** - EL5 & EL6
* **PHP 5.5** - EL6 only (Requires *scl::httpd24*)
* **MariaDB 5.5** - EL6 only
* **node.js 0.10** - EL6 only

## Usage

### Class: scl

Manages the *scl-utils* package

    class { 'scl': }

### Class: scl::build

Manages the *scl-utils-build* package

    class { 'scl::build': }

### Class: scl::*COLLECTION*

These classes define a *scl::collection* resource.

Each collection's class has the same basic parameters

* **repo_name** - yumrepo *namevar* attribute
* **repo_descr** - yumrepo *descr* attribute
* **repo_baseurl** - yumrepo *baseurl* attribute
* **repo_failovermethod** - yumrepo *failovermethod* attribute
* **repo_enabled** - yumrepo *enabled* attribute
* **repo_gpgcheck** - yumrepo *gpgcheck* attribute

Enable the ruby193 collection

    class { 'scl::ruby193': }

Using an alternative repo for a provided collection

    class { 'scl::mariadb55':
      repo_baseurl => 'http://yum.tamu.edu/software-collections/mariadb55-rhel-6-candidate/'
    }

### Define: scl::collection

This definition is used to manage a SCL yumrepo resource.  It can be used to define additional SCL repositories

An example of defining a ImageMagick-6.7 collection

    scl::collection { 'scl_ImageMagick67':
      repo_descr    => 'scl_ImageMagick67',
      repo_baseurl  => 'http://yum.tamu.edu/software-collections/ImageMagick67-rhel-6/',
      repo_enabled  => '1',
      repo_gpgcheck => '0',
    }

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake ci

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake spec:system

## Further Information

* [Red Hat Developer Toolset 1.1](https://access.redhat.com/site/documentation/en-US/Red_Hat_Developer_Toolset/1/html-single/Software_Collections_Guide/index.html)
* [Fedora Hosted Software Collections](https://fedorahosted.org/SoftwareCollections/)

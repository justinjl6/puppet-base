# base

## Overview

A simple Puppet module for managing basic OS configuration and services.

## Module Description

This module will install and configure many basic OS functions such as DNS and
NTP clients. Essentially presents a single place to configure many other
puppet modules such as puppetlabs-ntp and saz-resolv_conf.

## Setup

### What base affects

* Installs NTP service and ensures it runs (puppetlabs-ntp)
* Configures system timezone (saz-timezone)
* Configures system domain name and nameservers (saz-resolv_conf)
* Uninstalls resolvconf package
* Disables dhcp clients updating of resolv.conf

### Beginning with base

```
class { '::base' : }
```

## Usage

### Classes

Declare the class. There are a number of optional parameters whose defaults
are listed below:

```
class { '::base' :
    dns_domain  => 'local',
    dns_servers => [ '8.8.4.4', '8.8.8.8' ],
    timezone    => 'Etc/UTC',
    ntp_servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ],
}   
```

#### Parameters wthin `base`:


## Reference

### Public classes

* `base`: The main class used to interact with this module.

### Private classes

* `base::dns`: Class to set system timezone, system domain and nameservers (via saz-timezone and saz-resolv_conf)
* `base::ntp`: Class to install and configure the NTP service (via puppetlabs-ntp)

### Testing

#### Example Test

```
class { '::base' :
    dns_domain  => 'local',
    dns_servers => [ '8.8.4.4', '8.8.8.8' ],
    timezone    => 'Etc/UTC',
    ntp_servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ],
}   
```

`$ puppet parser validate tests/justinjl-base.pp`


## Limitations

This module is intended to work on any Linux/Unix system, however has only been tested on:

* Debian
* Ubuntu
* CentOS

Intention is to failsafe when unsupported systems/configurations are identified.

## Development

Appreciate any suggestions on feature or code changes. Let me know if you want to contribute or collaborate.


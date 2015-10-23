################################################################################
#
# Class: ::base::ntp
#
################################################################################

class base::ntp {

    # None of this will work in BSD jails
    case $::virtual {

        'jail':     { }

        default:    {
            class { '::timezone' :
                timezone => $::base::timezone,
            }

            class { '::ntp' :
                package_ensure  => 'present',
                service_ensure  => 'running',
                service_enable  => true,
                restrict        => [ '127.0.0.1', 'default kod nomodify notrap' ],
                servers         => $::base::ntp_servers,
            }
        }

    }

}

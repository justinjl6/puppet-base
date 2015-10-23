################################################################################
#
# Class: ::base::dns
#
################################################################################

class base::dns {

    # Sadly resolv_conf module doesn't support GNU/kFreeBSD
    case $::kernel {

        'GNU/kFreeBSD':     { }

        default:    {
            class { '::resolv_conf' :
                domainname  => $::base::dns_domain,
                nameservers => $::base::dns_servers,
                #searchpath => [ '' ],
            }
        }

    }

}

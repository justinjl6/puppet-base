################################################################################
#
# Class: ::base::dns
#
################################################################################

class base::dns {

    # Sadly resolv_conf module doesn"t support GNU/kFreeBSD
    case $::kernel {

        "GNU/kFreeBSD":     { }

        default:    {
            class { "::resolv_conf" :
                domainname  => $::base::dns_domain,
                nameservers => $::base::dns_servers,
                #searchpath => [ "" ],
            }

            # resolvconf is the worst
            package { "resolvconf" :
                ensure  => absent,
            }

            # also disable dhcp client updating resolv.conf (may need reboot?)
            file { "/etc/dhcp/dhclient-enter-hooks.d/nodnsupdate" :
                owner   => "root",
                group   => "root",
                mode    => "0644",
                content => "#!/bin/sh\nmake_resolv_conf(){\n    :\n}\n",
            }
        }

    }

}

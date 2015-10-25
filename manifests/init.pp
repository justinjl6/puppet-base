################################################################################
#
# Class: ::base
#
################################################################################

class base (

    # DNS Configuration
    $dns_domain     = 'local',
    $dns_servers    = [ '8.8.4.4', '8.8.8.8' ],

    # Time Configuration
    $timezone       = 'Etc/UTC',
    $ntp_servers    = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ],


) {

    anchor { '::base::begin' :  } ->
    class  { '::base::dns' :    } ->
    class  { '::base::ntp' :    } ->
    anchor { '::base::end' :    }

}

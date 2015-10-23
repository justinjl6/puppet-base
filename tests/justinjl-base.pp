class { '::base' :
    dns_domain  => 'local',
    dns_servers => [ '8.8.4.4', '8.8.8.8' ],
    timezone    => 'Etc/UTC',
    ntp_servers => [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ],
}

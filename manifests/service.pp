# Class: gitblit::service
#
# This module manages gitblit service
#
# Parameters: none
#
# Actions: defines the jetty service as starting at boot and checks it is
# running
#
# Requires: see Modulefile
#
# Sample Usage:
#
class gitblit::service {
  service { 'jetty':
    ensure => running,
    enable => true,
    path   => '/etc/init.d',
  }
}

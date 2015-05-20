# Class: gitblit
#
# This module manages gitblit
#
# Parameters:
#
# $distribution:: filename of the distribution to download.
# $port::         port Jetty will listen to.
# $gitblit_home:: home directory of hosted git repositories.
#
# Actions: installs, configure and sets up a gitblit service
#
# Requires: see Modulefile
#
# Sample Usage:
# include gitblit
# class gitblit { port => '9090' }
class gitblit (
  $distribution = $gitblit::params::distribution,
  $port         = $gitblit::params::port,
  $gitblit_home = $gitblit::params::gitblit_home) inherits gitblit::params {
  class { 'gitblit::install':
    distribution_url => $distribution,
  } -> class { 'gitblit::config':
    java_home    => $gitblit::params::java_home,
    jetty_port   => $port,
    gitblit_home => $gitblit_home,
  } ~> class { 'gitblit::service':
  }
}

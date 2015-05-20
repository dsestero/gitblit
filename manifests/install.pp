# Class: gitblit::install
#
# This module manages gitblit install
#
# Parameters: none
#
# Actions: installs the jetty package, then downloads and unpacks the gitblib
# distribution.
#
# Requires: see Modulefile
#
# Sample Usage:
#
class gitblit::install ($distribution_url) {
  require java::java_7

  package { 'jetty':
    ensure => installed,
  }

  file { ['/var/lib/gitblit', '/var/lib/gitblit/data']:
    ensure => directory,
    owner  => jetty,
    group  => adm,
  }

  download_uncompress { 'install_gitblit':
    distribution_name => $distribution_url,
    dest_folder       => '/var/lib/jetty/webapps/gitblit',
    creates           => "/var/lib/jetty/webapps/gitblit/WEB-INF",
    uncompress        => 'zip',
    user              => root,
    group             => root,
    require           => Package['jetty'],
  }

}

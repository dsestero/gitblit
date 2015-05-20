# Class: gitblit::config
#
# This module manages gitblit config
#
# Parameters: none
#
# $java_home::    java home directory.
# $jetty_port::   port Jetty will listen to.
# $gitblit_home:: home directory of hosted git repositories.
#
# Actions: configures jetty application server defaults
#
# Requires: see Modulefile
#
# Sample Usage:
#
class gitblit::config ($java_home, $jetty_port, $gitblit_home) {
  File {
    owner => jetty,
    group => adm,
  }

  file { '/etc/default/jetty':
    ensure  => present,
    content => template("${module_name}/jetty.default.erb"),
    owner   => root,
    group   => root,
  }

}

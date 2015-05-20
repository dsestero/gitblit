# Class: gitblit::params
#
# This module manages gitblit parameters
#
# Parameters:
#
# None
#
# Actions: sets defaults
#
# Requires: see Modulefile
#
# Sample Usage:
#
class gitblit::params () {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::operatingsystemrelease {
        '12.04' : {
          case $::architecture {
            'amd64' : {
              $java_home = '/usr/lib/jvm/java-7-openjdk-amd64'
            }
            default : {
              fail("The ${module_name} module is not supported on ${::operatingsystem} release ${::operatingsystemrelease} ${::architecture}"
              )
            }
          }
        }
        default : {
          fail("The ${module_name} module is not supported on ${::operatingsystem} release ${::operatingsystemrelease}"
          )
        }
      }
    }
    default  : {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution."
      )
    }
  }
  $port = '8080'
  $distribution = 'gitblit-1.6.2.war'
  $gitblit_home = '/var/lib/gitblit'
}

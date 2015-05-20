#gitblit

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with gitblit](#setup)
    * [What gitblit affects](#what-gitblit-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with gitblit](#beginning-with-gitblit)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This is the gitblit module. It installs, sets up and starts the gitblit service to allow small groups to host their Git repositories and make them accessible with a web browser.

##Module Description

The module installs the Jetty app server, then download and install the distribution of gitblit war, and sets up the file system in order to run the gitblit service.

##Setup

###What gitblit affects

The module installs the `jetty` package which in turn creates a jetty system user.
Furthermore, the module installs the Gitblit war distribution, sets up jetty defaults
in `/etc/defaults/jetty` and register at boot and starts the jetty service, listening on the specified port.

###Setup Requirements

This modules requires the following other modules to be installed:

* dsestero/download_uncompress

    to provide the basic capability to download and unzip the Gitblit distribution
    
* dsestero/java

    to install a suitable java development environment
    	
###Beginning with gitblit	

To install Gitblit as a service with default configuration, it is possible to use a declaration as the following:

```
include gitblit
```

##Usage

To install the Gitblit service listening on port 9090 and hosting the git repositories under /srv/git a typical declaration would be:
```
  class gitblit { 'install_gitblit':
    port             => '9090',
    gitblit_home     => '/srv/git',
  }
```

##Reference

###Public Classes

* [`gitblit::gitblit`](#gitblitgitblit): Manages gitblit

###Private Classes

* [`gitblit::params`](#gitblitparams): Specifies the module defaults
* [`gitblit::install`](#gitblitparams): Installs the module artifacts
* [`gitblit::config`](#gitblitparams): Configures the module artifacts
* [`gitblit::service`](#gitblitparams): Sets up the service

###`gitblit::gitblit`
Installs, configure and sets up a gitblit service.

####Parameters

#####`distribution`
String. Name or full url of the Gitblit war distribution to download.
Defaults to `gitblit-1.6.2.war` which will be downloaded from the `distributions_base_url` key defined in hiera (see the README of the download_uncompress module).

#####`port`
String. Port the jetty service will use. Defaults to `8080`.

#####`gitblit_home`
String. Path of the directory where Gitblib repositories will be hosted.
Defaults to `/var/lib/gitblit`.

##Limitations

At the moment the module targets only OpenJDK on Ubuntu platforms. Specifically, it is tested only on Ubuntu 12.04 distributions, although probably it will work also on more recent versions.

##Development

If you need some feature please send me a (pull) request or send me an email at: dsestero 'at' gmail 'dot' com.

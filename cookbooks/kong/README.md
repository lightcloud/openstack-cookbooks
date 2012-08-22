Description
===========

Installs the Rackspace Cloud Builders API verification suite, 'kong'.

http://github.com/rcbops/kong

Requirements
============

Chef 0.10.0 or higher required (for Chef environment use).

Platforms
--------

* Ubuntu-12.04
* Fedora-17


Recipes
=======

default
----
clones the kong suite from github, and populates the config.ini by performing a chef search for the relevant details


Attributes
==========

-- when testing swift with swauth the following are used:  

* `swift["auth_port"]` - auth port for swauth  
* `swift["auth_prefix"]` = gets appended to end of swauth IP  
* `swift["auth_ssl"]` = boolean toggle "yes/no"  
* `swift["account"]` = swauth account to test with  
* `swift["username"]` = swauth username to test with  
* `swift["password"]` = swauth password to test with  

-- the following are needed regardless

* `nova["network_label"]` = "public"  
* `kong["branch"]` = "master"


Templates
=====
* `config.ini.erb` -config file for kong


License and Author
==================

Author:: Justin Shepherd (<justin.shepherd@rackspace.com>)  
Author:: Jason Cannavale (<jason.cannavale@rackspace.com>)  
Author:: Ron Pedde (<ron.pedde@rackspace.com>)  
Author:: Joseph Breu (<joseph.breu@rackspace.com>)  
Author:: William Kelly (<william.kelly@rackspace.com>)  
Author:: Darren Birkett (<darren.birkett@rackspace.co.uk>)  
Author:: Evan Callicoat (<evan.callicoat@rackspace.com>)  

Copyright 2012, Rackspace US, Inc.  

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

  # (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
  #
  #   Licensed under the Apache License, Version 2.0 (the "License");
  #   you may not use this file except in compliance with the License.
  #   You may obtain a copy of the License at
  #
  #       http://www.apache.org/licenses/LICENSE-2.0
  #
  #   Unless required by applicable law or agreed to in writing, software
  #   distributed under the License is distributed on an "AS IS" BASIS,
  #   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  #   See the License for the specific language governing permissions and
  #   limitations under the License.

  # module designed to set up the parameters needed for sonatype nexus package

  # class definition - start
  class nexus::params (

    $nexus_package_version   =   hiera('nexus::params::nexus_package_version', '2.8.0'),
    $nexus_target_dir        =   hiera('nexus::params::nexus_target_dir', '/usr/local/nexus'),
    $app_name                =   hiera('nexus::params::app_name', 'nexus'),
  ){

    $path              =   hiera('nexus::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
    $nexus             =   "wget -O ${app_name}.war http://www.sonatype.org/downloads/nexus-${nexus_package_version}.war"
    $target_war_file   =   "${nexus_target_dir}/${app_name}.war"
  }
  # class definition - end
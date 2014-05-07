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

  # module designed to verify tomcat service

  # class definition - start
  class modus_tomcat::tomcat_service (

    $tomcat_autodeploy_dir   =   $modus_tomcat::tomcat_service::tomcat_autodeploy_dir,
    $tomcat_service          =   $modus_tomcat::tomcat_service::tomcat_service,
    $tomcat_staging_dir      =   $modus_tomcat::tomcat_service::tomcat_staging_dir,
  ) inherits modus_tomcat::tomcat_params {

    # class required for this module to work
    require modus_tomcat::tomcat_package

    # verify if postfix service is running
    service { "${tomcat_service}":
      ensure   =>   running,
      enable   =>   true,
    }

    file { "${tomcat_autodeploy_dir}":
      ensure   =>   directory,
    }

    file { "${tomcat_staging_dir}":
      ensure   =>   directory,
    }
  }
  # class definition - end
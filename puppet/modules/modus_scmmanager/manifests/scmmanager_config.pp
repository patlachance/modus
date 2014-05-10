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

  # module designed to install and set up scm-manager

  # class definition - start
  class modus_scmmanager::scmmanager_config
  inherits modus_scmmanager::scmmanager_params {

    # class required for this module to work
    require modus_scmmanager::scmmanager_package

    # run mvn install clean which will set up and configure scm-manager
    exec { "mvn clean install":
      path          =>   $path,
      cwd           =>   $scmmanager_target_dir,
      user          =>   root,
      group         =>   root,
      logoutput     =>   true,
      timeout       =>   0,
    }

    class { '::modus_tomcat::tomcat_war':
      app_name          =>   $app_name,
      target_war_file   =>   $target_war_file,
      require           =>   Exec['mvn clean install'],
    }
  }
  # class definition - end

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

  # module designed to install and set up the latest openjdk package

  # class definition - start
  class modus_openjdk::openjdk_package
  inherits modus_openjdk::openjdk_params {

    # openjdk jre default package installation
    if ! defined(Package["${openjdk_default_jre_package}"]) {
      package { "${openjdk_default_jre_package}":
        ensure   =>   installed,
      }
    }

    # openjdk jdk default package installation
    if ! defined(Package["${openjdk_default_jdk_package}"]) {
      package { "${openjdk_default_jdk_package}":
        ensure   =>   installed,
      }
    }

    # openjdk jre package installation
    if ! defined(Package["${openjdk_jre_package}"]) {
      package { "${openjdk_jre_package}":
        ensure   =>   installed,
      }
    }

    # openjdk jdk package installation
    if ! defined(Package["${openjdk_jdk_package}"]) {
      package { "${openjdk_jdk_package}":
        ensure   =>   installed,
      }
    }
  }
  # class definition - end
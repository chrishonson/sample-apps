#
#  Copyright 2016 CyberVision, Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

args@
{ posixSupport ? null
, clangSupport ? null
, cc3200Support ? null
, esp8266Support ? null
, raspberrypiSupport ? null
, testSupport ? null
, withWerror ? null
, withTooling ? null
}:

let pkgs = import ./nix { };

in pkgs.kaa-client-c.override {
  cc3200Support = true;
  doUnpack = true;
  flags = "-DCMAKE_BUILD_TYPE=MinSizeRel " +
          "-DKAA_PLATFORM=cc32xx " +
          "-DKAA_TARGET=cc32xx " +
          "-DKAA_PRODUCE_BINARY=1 " +
          "-DKAA_MAX_LOG_LEVEL=3 " +
          "-DKAA_DEBUG_ENABLE=true " +
          "-DCMAKE_TOOLCHAIN_FILE=libs/kaa/toolchains/cc32xx.cmake " +
          "-DWIFI_SSID= " +
          "-DWIFI_PASSWORD= ";
}
#!/usr/bin/env bash
#source /home/juan/rti_connext_dds-5.2.3/resource/scripts/rtisetenv_armv6vfphLinux3.xgcc4.7.2.bash
rm -rf src/objs
rm src/*.h
rm src/*.cxx
rm src/*.xml
rm src/make*

cd src
rtiddsgen -replace -language C++ -example armv6vfphLinux3.xgcc4.7.2 ../idl/*.idl -d ./

perl -pi -e 's/-march=armv6/-march=armv7-a/g' makefile*

make -f  app_makefile


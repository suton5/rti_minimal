#!/usr/bin/env bash
#source /home/juan/rti_connext_dds-5.2.3/resource/scripts/rtisetenv_x64Linux3gcc4.8.2.bash
rm -rf src/objs
rm src/*.h
rm src/*.cxx
rm src/*.xml
rm src/make*

cd src
rtiddsgen -replace -language C++ -example x64Linux3gcc4.8.2 ../idl/*.idl -d ./
#rtiddsgen -replace -language C++ -example x64Linux3gcc4.8.2 -inputXml ../idl/*.xml -d ./

#rtiddsgen -replace -language C++ -example armv6vfphLinux3.xgcc4.7.2 ../idl/*.idl -d ./

make -f  app_makefile


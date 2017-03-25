#!/usr/bin/env bash
#source /home/juan/rti_connext_dds-5.2.3/resource/scripts/rtisetenv_x64Linux3gcc4.8.2.bash
cd src
rtiddsgen -replace -language C++ -example x64Linux3gcc4.8.2 ../idl/*.idl -d ./
make -f make*


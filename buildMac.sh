#!/bin/sh

rm -rf src/objs
rm src/*.h
rm src/*.cxx
rm src/*.xml
rm src/make*

#Generate sample codes for RTI pub-sub
cd src
($NDDSHOME)/bin/rtiddsgen -replace -language C++ -example x64Darwin15clang7.0  ../idl/*.idl -d ./

#Add libraries from app_makefile to generated makefile (this is a hack for now)
perl -pi -e 's/INCLUDES =/INCLUDES +=/g' makefile*
perl -pi -e 's/COMMONSOURCES =/COMMONSOURCES +=/g' makefile*

make -f  app_makefile

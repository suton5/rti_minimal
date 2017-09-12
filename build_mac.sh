#!/bin/sh

rm -rf src/objs
rm src/*.h
rm src/*.cxx
rm src/*.xml
rm src/make*

#Generate sample codes for RTI pub-sub
cd src
($NDDSHOME)/bin/rtiddsgen -replace -language C++ -example x64Darwin15clang7.0  ../idl/*.idl -d ./

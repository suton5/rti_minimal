cmake_minimum_required(VERSION 2.8.3)
project(rti_ros)

# Set C++11
include(CheckCXXCompilerFlag)
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_COMPILER_IS_CLANG OR
        CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    check_cxx_compiler_flag(--std=c++11 SUPPORTS_CXX11)
    if(SUPPORTS_CXX11)
        add_compile_options(--std=c++11)
    else()
        message(FATAL_ERROR "Compiler doesn't support C++11")
    endif()
endif()

# Make CMake aware of the cmake folder for local FindXXX scripts.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(RTI REQUIRED)

set(NDDSHOME $ENV{NDDSHOME})

include_directories(
  ${NDDSHOME}/include
  ${NDDSHOME}/include/ndds
  include
)

add_definitions(-DRTI_UNIX)

link_directories(
  ${NDDSHOME}/lib/x64Linux3gcc4.8.2
  ${NDDSHOME}/lib/armv6vfphLinux3.xgcc4.7.2
)

add_library(Velocities_lib
  src/Velocities.cxx
  src/VelocitiesPlugin.cxx
  src/VelocitiesSupport.cxx
)

target_link_libraries(Velocities_lib
  nddsc
  nddscpp
  nddscore
  ${CMAKE_DL_LIBS}
)

add_executable(publisher
  src/Velocities_publisher.cxx
)

target_link_libraries(publisher
  Velocities_lib
)

add_executable(subscriber
  src/Velocities_subscriber.cxx
)

target_link_libraries(subscriber
  Velocities_lib
)
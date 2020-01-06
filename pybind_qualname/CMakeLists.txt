cmake_minimum_required(VERSION 2.8.5)
project(test_pybind11 CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Tested with python 3.7
set(PATH_TO_PYBIND /home/chaturvedi/workspace/pybind11/build_master_ninja/install/share/cmake/pybind11)
# IMPORT pybind11
find_package(pybind11 REQUIRED CONFIG PATHS ${PATH_TO_PYBIND})

configure_file(main.py ${CMAKE_BINARY_DIR} COPYONLY)
configure_file(python_module.py ${CMAKE_BINARY_DIR} COPYONLY)
pybind11_add_module(pybind_module main.cpp)

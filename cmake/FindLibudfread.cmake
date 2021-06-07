#[=======================================================================[.rst:
FindLibudfread
-------

Finds the udfread library.

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``libudfread_FOUND``
  True if the system has the Foo library.
``libudfread_VERSION``
  The version of the Foo library which was found.
``libudfread_INCLUDE_DIR``
  Include directories needed to use Foo.
``libudfread_LIBRARY``
  Libraries needed to link to Foo.

#]=======================================================================]
find_path(
  LIBUDFREAD_INCLUDE_DIR
  NAMES
    udfread/udfread.h
  PATH_SUFFIXES
    include
)

find_library(LIBUDFREAD_LIBRARY
NAMES
  libudfread
  udfread
  libudfread-static
  udfread-static
PATH_SUFFIXES
  lib
)
file(TO_CMAKE_PATH "${LIBUDFREAD_LIBRARY}" LIBUDFREAD_LIBRARY)

if (EXISTS "${LIBUDFREAD_INCLUDE_DIR}/udfread/udfread-version.h")
    set(UDFREAD_VERSION_H "${LIBUDFREAD_INCLUDE_DIR}/udfread/udfread-version.h")
endif()

if(LIBUDFREAD_INCLUDE_DIR AND UDFREAD_VERSION_H)
  file(STRINGS "${UDFREAD_VERSION_H}" libudfread_version_str
       REGEX "^#[\t ]*define[\t ]+UDFREAD_VERSION_STRING[\t ]+\"[0-9.]+\"$")

  unset(LIBUDFREAD_VERSION_STRING)
  string(REGEX MATCH "[0-9.]+" LIBUDFREAD_VERSION_STRING ${libudfread_version_str})
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(
  Libudfread
  REQUIRED_VARS
    LIBUDFREAD_LIBRARY
    LIBUDFREAD_INCLUDE_DIR
  VERSION_VAR
    LIBUDFREAD_VERSION_STRING
)

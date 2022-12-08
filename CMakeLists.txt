cmake_minimum_required(VERSION 2.8)

PROJECT(usign C)

add_definitions(-D_CRT_SECURE_NO_WARNINGS)
SET(SOURCES ed25519.c edsign.c f25519.c fprime.c sha512.c main.c)

IF (WIN32)
	MESSAGE(STATUS "Now is windows")
  SET(SOURCES  ${SOURCES} win32/mman.c win32/getopt.c)
  INCLUDE_DIRECTORIES(win32/)
  add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
  add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")
ELSEIF (APPLE)
	MESSAGE(STATUS "Now is Apple systens.")
  ADD_DEFINITIONS(-O2 -Wall -Werror --std=gnu99 -g3 -Wmissing-declarations)
ELSEIF (UNIX)
	MESSAGE(STATUS "Now is UNIX-like OS's.")
  ADD_DEFINITIONS(-O2 -Wall -Werror --std=gnu99 -g3 -Wmissing-declarations)
ENDIF ()

SET(LIBS)
IF(USE_LIBUBOX)
  ADD_DEFINITIONS(-DUSE_LIBUBOX)
  SET(LIBS ubox)
  FIND_PATH(ubox_include_dir libubox/utils.h)
  INCLUDE_DIRECTORIES(${ubox_include_dir})
ELSE()
  SET(SOURCES ${SOURCES} base64.c)
ENDIF()

ADD_EXECUTABLE(usign ${SOURCES})
TARGET_LINK_LIBRARIES(usign ${LIBS})

INSTALL(TARGETS usign
	RUNTIME DESTINATION bin
)

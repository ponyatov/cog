# Install script for directory: /home/ponyatov/cog/opencog/opencog/nlp/sentiment

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ponyatov/opencog")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ponyatov/opencog/share/opencog/scm/opencog/nlp/sentiment.scm")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/ponyatov/opencog/share/opencog/scm/opencog/nlp" TYPE FILE FILES "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/sentiment.scm")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/sentiment" TYPE FILE FILES "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/basic_sentiment_analysis.py")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/positive.yml;${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/negative.yml;${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/inc.yml;${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/dec.yml;${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/inv.yml;${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts/sentiWordNet.txt")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/opencog/dicts" TYPE FILE FILES
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/positive.yml"
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/negative.yml"
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/inc.yml"
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/dec.yml"
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/inv.yml"
    "/home/ponyatov/cog/opencog/opencog/nlp/sentiment/dicts/sentiWordNet.txt"
    )
endif()


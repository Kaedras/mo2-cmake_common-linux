cmake_minimum_required(VERSION 3.22)

if (DEFINED MO2_DEFINED)
	return()
endif()

option(MO2_INSTALL_IS_BIN
	"if set, CMAKE_INSTALL_PREFIX is assumed to point to bin rather than one level below")

if (MO2_INSTALL_IS_BIN)
	set(MO2_INSTALL_BIN ".")
else()
	set(MO2_INSTALL_BIN "bin")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/mo2_versions.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/mo2_utils.cmake)

set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD 1)

set(Python_FIND_VIRTUALENV STANDARD)

set(CMAKE_MAP_IMPORTED_CONFIG_MINSIZEREL MinSizeRel RelWithDebInfo Release None)
set(CMAKE_MAP_IMPORTED_CONFIG_RELWITHDEBINFO RelWithDebInfo Release MinSizeRel None)
set(CMAKE_MAP_IMPORTED_CONFIG_RELEASE Release RelWithDebInfo MinSizeRel None)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY AUTOGEN_SOURCE_GROUP autogen)
set_property(GLOBAL PROPERTY AUTOMOC_SOURCE_GROUP autogen)
set_property(GLOBAL PROPERTY AUTORCC_SOURCE_GROUP autogen)

include(${CMAKE_CURRENT_LIST_DIR}/mo2_cpp.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/mo2_python.cmake)

set(QT_TARGETS_FOLDER autogen)

# mark as included
set(MO2_DEFINED true)

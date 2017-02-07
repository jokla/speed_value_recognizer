#############################################################################
#
# This file is part of the ViSP software.
# Copyright (C) 2005 - 2014 by INRIA. All rights reserved.
# 
# This software is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# ("GPL") version 2 as published by the Free Software Foundation.
# See the file LICENSE.txt at the root directory of this source
# distribution for additional information about the GNU GPL.
#
# For using ViSP with software that can not be combined with the GNU
# GPL, please contact INRIA about acquiring a ViSP Professional 
# Edition License.
#
# See http://www.irisa.fr/lagadic/visp/visp.html for more information.
# 
# This software was developed at:
# INRIA Rennes - Bretagne Atlantique
# Campus Universitaire de Beaulieu
# 35042 Rennes Cedex
# France
# http://www.irisa.fr/lagadic
#
# If you have questions regarding the use of this file, please contact
# INRIA at visp@inria.fr
# 
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# Description:
# Try to find TESSERACT library.
# Once run this will define: 
#
# TESSERACT_FOUND
# TESSERACT_INCLUDE_DIRS
# TESSERACT_LIBRARIES
#
# Authors:
# Fabien Spindler
#
#############################################################################

  
find_path(TESSERACT_INCLUDE_DIRS tesseract/baseapi.h
  $ENV{TESSERACT_DIR}/include
  /usr/include
  /usr/local/include 
)

find_library(TESSERACT_LIBRARIES
  NAMES tesseract
  PATHS 
    $ENV{TESSERACT_DIR}/lib
    /usr/lib
    /usr/local/lib
)

if(TESSERACT_INCLUDE_DIRS AND TESSERACT_LIBRARIES)
  set(TESSERACT_FOUND TRUE)
else()
  set(TESSERACT_FOUND FALSE)
endif()
  
mark_as_advanced(
  TESSERACT_INCLUDE_DIRS
  TESSERACT_LIBRARIES
)

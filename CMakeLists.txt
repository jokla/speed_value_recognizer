project(speed_value_recognizer) 
cmake_minimum_required(VERSION 2.6)
 
 
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

find_package( OpenCV REQUIRED )

find_package(TESSERACT REQUIRED)
if(TESSERACT_FOUND)
  include_directories(${TESSERACT_INCLUDE_DIRS})
endif()

include_directories("${CMAKE_SOURCE_DIR}/lib")

#Read text
add_executable( read_text read_text.cpp)
target_link_libraries(read_text ${TESSERACT_LIBRARIES} ${OpenCV_LIBS})



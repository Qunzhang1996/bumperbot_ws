execute_process(COMMAND "/home/zq/bumperbot_ws/build/bumperbot_controller/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/zq/bumperbot_ws/build/bumperbot_controller/catkin_generated/python_distutils_install.sh) returned error code ")
endif()

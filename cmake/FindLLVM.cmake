if (NOT LLVM_FOUND)
  find_program(LLVM_CONFIG_EXECUTABLE CACHE NAMES llvm-config DOC "Path to llvm-config binary")

  if (LLVM_CONFIG_EXECUTABLE)
    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --version
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_VERSION
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --prefix
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_ROOT
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --includedir
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_INCLUDE_DIR
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --bindir
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_TOOLS_BINARY_DIR
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --libdir
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_LIBRARY_DIR
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --cppflags
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_CPPFLAGS
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --cxxflags
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_CXXFLAGS
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --ldflags
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_LDFLAGS
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --obj-root
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_OBJ_ROOT
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --libs core bitreader asmparser analysis
      RESULT_VARIABLE HAD_ERROR
      OUTPUT_VARIABLE LLVM_MODULE_LIBS
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if (HAD_ERROR)
      message(FATAL_ERROR "llvm-config failed with status: ${HAD_ERROR}")
    endif()

    execute_process(
      COMMAND ${LLVM_CONFIG_EXECUTABLE} --cmakedir
      OUTPUT_VARIABLE LLVM_CMAKE_DIR
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  endif()

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(LLVM
    REQUIRED_VARS
      LLVM_VERSION
      LLVM_ROOT
      LLVM_INCLUDE_DIR
      LLVM_TOOLS_BINARY_DIR
      LLVM_LIBRARY_DIR
      LLVM_CPPFLAGS
      LLVM_CXXFLAGS
      LLVM_LDFLAGS
      LLVM_OBJ_ROOT
      LLVM_MODULE_LIBS
    VERSION_VAR
      LLVM_VERSION
    FAIL_MESSAGE
      "Could NOT find LLVM. Please provide -DLLVM_CONFIG_EXECUTABLE=/path/to/llvm-config")
endif()

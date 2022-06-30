cmake_minimum_required(VERSION 3.10)

# 设置项目名和版本号
project(Tutorial VERSION 1.0)

# 指定 C++ 的版本
set(CMAKE_CXX_STANDARD 11)		# C++11
set(CMAKE_CXX_STANDARD_REQUIRED True)	

# 配置文件的版本参数
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)
# CMakeLists.txt 设置的变量会替换 .h.in 里面同名的符号，并写入到 .h 文件中。
# 如：Tutorial_VERSION_MAJOR 的值替换 @Tutorial_VERSION_MAJOR@ 符号
# .h.in
# #define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
# .h
# #define Tutorial_VERSION_MAJOR 1

######################## Step 2: Adding a Library Begin ########################
# 是否使用自定义的数据库的选项
option(USE_MYMATH "Use tutorial provided math implementation" ON) # or OFF 
if(USE_MYMATH)
	# 添加子目录。用于构建 MathFunction 库
	add_subdirectory(MathFunctions)	# ./MathFunctions 目录里面要有一个 CMakeLists.txt 文件用于构建 MathFunctions 库。
	list(APPEND EXTRA_LIBS MathFunctions)
	list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/MathFunctions")
endif()
######################### Step 2: Adding a Library End #########################

# 设置配置文件，由配置文件 (.h.in) 生成头文件 (.h)
#configure_file(TutorialConfig.h.in TutorialConfig.h)	# 默认与 CMakeLists.txt 文件同一目录
configure_file("${PROJECT_SOURCE_DIR}/TutorialConfig.h.in" # .h 的模板文件
		"${PROJECT_SOURCE_DIR}/TutorialConfig.h")
# ${PROJECT_SOURCE_DIR}: 当前工程最上层目录
# ${PROJECT_BINARY_DIR}: 当前工程的构造目录，既 build。
 # configure_file(<input> <output>
#                [COPYONLY] [ESCAPE_QUOTES] [@ONLY]
#                [NEWLINE_STYLE [UNIX|DOS|WIN32|LF|CRLF] ])

# 添加可执行目标
add_executable(Tutorial tutorial.cxx)
# add_executable(<name> [WIN32] [MACOSX_BUNDLE]
#               [EXCLUDE_FROM_ALL]
#               source1 [source2 ...])
# name: 工程所构建的目标名称
# WIN32：目标 app 运行的平台
# source1：构建目标 app 的源文件

######################## Step 2: Adding a Library Begin ########################
# 设置头文件路径。必须放在 add_executable() 后面，否则会报错。
target_include_directories(Tutorial PUBLIC 
	"${PROJECT_SOURCE_DIR}"
	# "${PROJECT_SOURCE_DIR}/MathFunctions"
	${EXTRA_INCLUDES}
	)

# 设置目标要链接的库的路径
target_link_libraries(Tutorial PUBLIC
	# "${PROJECT_SOURCE_DIR}/MathFunctions"
	${EXTRA_LIBS}
	)
######################### Step 2: Adding a Library End #########################
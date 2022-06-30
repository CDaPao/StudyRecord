cmake_minimum_required(VERSION 3.10)

# 设置项目名和版本号
project(Tutorial VERSION 1.0)

# 指定 C++ 的版本
set(CMAKE_CXX_STANDARD 11)		# C++11
set(CMAKE_CXX_STANDARD_REQUIRED True)	

# 配置文件的版本参数
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)

############# Step 3: Adding Usage Requirements for a Library Begin ############
# 是否使用自定义的数据库的选项
option(USE_MYMATH "Use tutorial provided math implementation" ON) # or OFF 
if(USE_MYMATH)
	# 添加子目录。用于构建 MathFunction 库
	add_subdirectory(MathFunctions)	# ./MathFunctions 目录里面要有一个 CMakeLists.txt 文件用于构建 MathFunctions 库。
	list(APPEND EXTRA_LIBS MathFunctions)
endif()
############# Step 3: Adding Usage Requirements for a Library End ##############

# 设置配置文件，由配置文件 (.h.in) 生成头文件 (.h)
#configure_file(TutorialConfig.h.in TutorialConfig.h)	# 默认与 CMakeLists.txt 文件同一目录
configure_file("${PROJECT_SOURCE_DIR}/TutorialConfig.h.in" # .h 的模板文件
		"${PROJECT_SOURCE_DIR}/TutorialConfig.h")
# ${PROJECT_SOURCE_DIR}: 当前工程最上层目录
# ${PROJECT_BINARY_DIR}: 当前工程的构造目录，既 build。

# 添加可执行目标
add_executable(Tutorial tutorial.cxx)

############# Step 3: Adding Usage Requirements for a Library Begin ############
# 设置头文件路径。必须放在 add_executable() 后面，否则会报错。
target_include_directories(Tutorial PUBLIC 
	"${PROJECT_SOURCE_DIR}"
	)

# 设置目标要链接的库的路径
target_link_libraries(Tutorial PUBLIC
	# "${PROJECT_SOURCE_DIR}/MathFunctions"
	${EXTRA_LIBS}
	)
############# Step 3: Adding Usage Requirements for a Library End ##############
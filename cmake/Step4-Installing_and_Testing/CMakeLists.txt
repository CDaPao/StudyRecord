cmake_minimum_required(VERSION 3.10)

# 设置项目名和版本号
project(Tutorial VERSION 1.0)

# 指定 C++ 的版本
set(CMAKE_CXX_STANDARD 11)		# C++11
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 配置文件的版本参数
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)

# 是否使用自定义的数据库的选项
option(USE_MYMATH "Use tutorial provided math implementation" ON) # or OFF
if(USE_MYMATH)
	# 添加子目录。用于构建 MathFunction 库
	add_subdirectory(MathFunctions)	# ./MathFunctions 目录里面要有一个 CMakeLists.txt 文件用于构建 MathFunctions 库。
	list(APPEND EXTRA_LIBS MathFunctions)
endif()

# 设置配置文件，由配置文件 (.h.in) 生成头文件 (.h)
#configure_file(TutorialConfig.h.in TutorialConfig.h)	# 默认与 CMakeLists.txt 文件同一目录
configure_file("${PROJECT_SOURCE_DIR}/TutorialConfig.h.in" # .h 的模板文件
	"${PROJECT_SOURCE_DIR}/TutorialConfig.h")
# ${PROJECT_SOURCE_DIR}: 当前工程最上层目录
# ${PROJECT_BINARY_DIR}: 当前工程的构造目录，既 build。


# 添加可执行目标
add_executable(Tutorial tutorial.cxx)

# 设置头文件路径。必须放在 add_executable() 后面，否则会报错。
target_include_directories(Tutorial PUBLIC
	"${PROJECT_SOURCE_DIR}"
	)

# 设置目标要链接的库的路径
target_link_libraries(Tutorial PUBLIC
	# "${PROJECT_SOURCE_DIR}/MathFunctions"
	${EXTRA_LIBS}
	)

#################### Step 4: Installing and Testing Begin ######################
# 安装可执行文件
# 将 Tutorial 这个可执行文件，安装到 bin 目录下
install(TARGETS Tutorial DESTINATION bin)
# 安装配置头
# 将 ${PROJECT_SOURCE_DIR}/Tutorial.h 这个可执行文件，安装到 include 目录下
install(FILES "${PROJECT_SOURCE_DIR}/TutorialConfig.h" DESTINATION include)

# 验证安装
enable_testing()
# 测试程序运行
add_test(NAME Runs COMMAND Tutorial 25)

# 使用 PASS_REGULAR_EXPRESSION 测试属性来验证测试输出包含特定字符串。测试在输入参数数量不对时打印的信息
add_test(NAME Usage COMMAND Tutorial)
set_tests_properties(Usage PROPERTIES PASS_REGULAR_EXPRESSSION "Usage:.*number")

# 验证程序的计算结果
function(do_test target arg result)
	add_test(NAME Comp${arg} COMMAND ${target} ${arg})
	set_tests_properties(Comp${arg}
		PROPERTIES PASS_REGULAR_EXPORESSION ${result}
		)
endfunction()

do_test(Tutorial 4 "4 is 2")
do_test(Tutorial 9 "9 is 3")
do_test(Tutorial 5 "5 is 2.236")
do_test(Tutorial 7 "7 is 2.645")
do_test(Tutorial 25 "25 is 5")
do_test(Tutorial -25 "-25 is {-nan|nan|0}")
do_test(Tutorial 0.0001 "0.0001 is 0.01")

add_test(TutorialComp100 Tutorial 100)
set_tests_properties(TutorialComp100 PROPERTIES PASS_REGULAR_EXPORESSION "100 is 10")
##################### Step 4: Installing and Testing End #######################
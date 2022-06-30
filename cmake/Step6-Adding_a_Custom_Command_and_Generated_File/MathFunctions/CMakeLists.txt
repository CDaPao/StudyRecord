########### Step 6: Adding a Custom Command and Generated File Begin ###########
# 添加 MakeTable 可执行程序
add_executable(MakeTable MakeTable.cxx)

# 添加一个由 MakeTable 程序生成 Table.h 的自定义命令
add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
	COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
	DEPENDS MakeTable
	)

# 将 Table.h 添加到 MathFunction 库中
add_library(MathFunctions 
	mysqrt.cxx
	${CMAKE_CURRENT_BINARY_DIR}/Table.h
	)

# INTERFACE 指的是消费者需要，而非生产者需要的东西。
# 例如：任何链接到 MathFunctions 的对象都需要包含 MathFunctions 路径，除 MathFunctions 本身外，所以 MathFunctions 的路径可以作为一个 INTERFACE 的依赖。
target_include_directories(MathFunctions 
	INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
	PRIVATE ${CMAKE_CURRENT_BINARY_DIR} # 添加 Table.h 的路径
	)
############ Step 6: Adding a Custom Command and Generated File End ############

# 安装库
install(TARGETS MathFunctions DESTINATION lib)
# 安装头文件
install(FILES MathFunctions.h DESTINATION include)

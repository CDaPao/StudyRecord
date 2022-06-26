add_library(MathFunctions mysqrt.cxx)
# INTERFACE 指的是消费者需要，而非生产者需要的东西。
# 例如：任何链接到 MathFunctions 的对象都需要包含 MathFunctions 路径，除 MathFunctions 本身外，所以 MathFunctions 的路径可以作为一个 INTERFACE 的依赖。
target_include_directories(MathFunctions 
	INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
	)

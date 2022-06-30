add_library(MathFunctions mysqrt.cxx)
# INTERFACE 指的是消费者需要，而非生产者需要的东西。
# 例如：任何链接到 MathFunctions 的对象都需要包含 MathFunctions 路径，除 MathFunctions 本身外，所以 MathFunctions 的路径可以作为一个 INTERFACE 的依赖。
target_include_directories(MathFunctions 
	INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
	)
    
################## Step 5: Adding System Introspection Begin ####################
# 检查是否编译链接成功
include(CheckCXXSourceCompiles)
check_cxx_source_compiles("
	#include <cmath>
	int main()
	{
		std::log(1.0);
		return 0;
	}
	" HAVE_LOG)
check_cxx_source_compiles("
	#include <cmath>
	int main()
	{
		std::exp(1.0);
		return 0;
	}
	" HAVE_EXP)

# 添加 HAVE_LOG 和 HAVE_EXP 到目标
if(HAVE_LOG AND HAVE_EXP)
	target_compile_definitions(MathFunctions
		PRIVATE "HAVE_LOG" "HAVE_EXP"
		)
endif()
################## Step 5: Adding System Introspection End #####################

# 安装库
install(TARGETS MathFunctions DESTINATION lib)
# 安装头文件
install(FILES MathFunctions.h DESTINATION include)

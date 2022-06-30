# CMake generated Testfile for 
# Source directory: /home/user/source/CMake/Help/guide/tutorial/Step8
# Build directory: /home/user/source/CMake/Help/guide/tutorial/Step8/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Runs "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "25")
set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;58;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Usage "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSSION "Usage:.*number" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;61;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp4 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "4")
set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPORESSION "4 is 2" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;72;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp9 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "9")
set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPORESSION "9 is 3" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;73;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp5 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "5")
set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPORESSION "5 is 2.236" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;74;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp7 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "7")
set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPORESSION "7 is 2.645" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;75;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp25 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "25")
set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPORESSION "25 is 5" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;76;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp-25 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "-25")
set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPORESSION "-25 is {-nan|nan|0}" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;77;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(Comp0.0001 "/home/user/source/CMake/Help/guide/tutorial/Step8/build/Tutorial" "0.0001")
set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPORESSION "0.0001 is 0.01" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;66;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;78;do_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
add_test(TutorialComp100 "Tutorial" "100")
set_tests_properties(TutorialComp100 PROPERTIES  PASS_REGULAR_EXPORESSION "100 is 10" _BACKTRACE_TRIPLES "/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;80;add_test;/home/user/source/CMake/Help/guide/tutorial/Step8/CMakeLists.txt;0;")
subdirs("MathFunctions")

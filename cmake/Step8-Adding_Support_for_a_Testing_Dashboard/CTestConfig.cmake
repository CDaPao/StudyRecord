############# Step 8: Adding Support for a Testing Dashboard Begin #############
set(CTEST_PROJECT_NAME "CMakeTutorial")         # 项目名称
set(CTEST_NIGHTLY_START_TIME "00:00:00 EST")    # 每晚开始测试的事件
# 测试结果发送到公共仪表盘的 URL
set(CTEST_DROP_METHOD "http")
set(CTEST_DROP_SITE "my.cdash.org")
set(CTEST_DROP_LOCATION "/submit.php?project=CMakeTutorial")
set(CTEST_DROP_SITE_CDASH TRUE)
############## Step 8: Adding Support for a Testing Dashboard End ##############
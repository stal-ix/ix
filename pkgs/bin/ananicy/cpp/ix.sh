{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v1.0.2/ananicy-cpp-v1.0.2.tar.bz2
sha:6504a95bc6846dd93cfefc1e60526a43a4b9a3424f4fc834842ea60fc797cccf
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/spdlog
lib/execinfo
lib/shim/gnu
lib/fmt/polyfill
lib/jthread/polyfill
lib/json/nlohmann/11
{% endblock %}

{% block patch %}
cat << EOF > external/std-format/CMakeLists.txt
add_library(stl_polyfill_format INTERFACE)
add_library(stl_polyfill::format ALIAS stl_polyfill_format)
EOF

sed -e 's|std::formatter|fmt::formatter|' -i include/utility/argument_parser.hpp
{% endblock %}

{% block cmake_flags %}
ENABLE_SYSTEMD=OFF
USE_EXTERNAL_JSON=ON
USE_EXTERNAL_SPDLOG=ON
USE_EXTERNAL_FMTLIB=ON
{% endblock %}

{% block cpp_missing %}
unistd.h
sys/time.h
{% endblock %}

{% block setup %}
export CXXFLAGS="-include sstream ${CXXFLAGS}"
{% endblock %}

{% block cpp_defines %}
SCHED_ISO=4
__priority_which_t=int
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

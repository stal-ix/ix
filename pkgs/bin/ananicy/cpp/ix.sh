{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://gitlab.com/ananicy-cpp/ananicy-cpp
{% endblock %}

{% block git_branch %}
v1.0.2
{% endblock %}

{% block git_sha %}
018a67f556011f2558af7d79f41bca3bb1c2aab2949344a80a1d44d7778d3417
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

{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://gitlab.com/ananicy-cpp/ananicy-cpp
{% endblock %}

{% block git_branch %}
v1.0.2
{% endblock %}

{% block git_sha %}
fc24f8170b9ecb3f39a7a07d68cae3edb73769387460be2b076b44c66c8a8965
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/spdlog
lib/execinfo
lib/shim/gnu
lib/fmt/polyfill
lib/json/nlohmann
lib/jthread/polyfill
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

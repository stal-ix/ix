{% extends '//die/c/cmake.sh' %}

# check bin/ananicy

{% block pkg_name %}
ananicy-cpp
{% endblock %}

{% block version %}
1.1.1
{% endblock %}

{% block git_repo %}
https://gitlab.com/ananicy-cpp/ananicy-cpp
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
e0e110890778f7bbe756e8d93c0f7b8b95af3f224f5e3b15bb477d7f48235916
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/spdlog
lib/execinfo
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

{% block cxx_flags %}
-Wno-missing-template-arg-list-after-template-kw
-includesstream
{% endblock %}

{% block cpp_defines %}
SCHED_ISO=4
__priority_which_t=int
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block git_version %}
v3
{% endblock %}

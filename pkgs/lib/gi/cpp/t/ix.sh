{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
4809a367d99894a7ec16e6e2fb259923a8efb1434072e852c4711a962beb1991
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
69ef481cba38e848554cc5403b8d4141d3c51335
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/fmt
lib/boost
lib/shim/fs
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block patch %}
cat << EOF >> tools/common.hpp
#include <map>
EOF
{% endblock %}

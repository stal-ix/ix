{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
76eb46c3c161b645269cc58f5029dd1f50937c5aed22f34b11a0666232724144
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
83d94749d94fdb9b9e97a3e942f73a587a6ef253
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

{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
7558febf9ebb2b647891f9b029089dbf9c0f981d6ba0e1dada711a0a7e65a5db
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
9c4f5820d94d62ab451501f016bfea97156518f4
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

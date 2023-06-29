{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
ee1a5e21ae782d7261d0ed43c87894aa10fe1b11fbbf5e174897581e01f8bce5
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
70b0e3d522cec60316d116dcbd919b797e85685a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
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

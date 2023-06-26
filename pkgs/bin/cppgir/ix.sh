{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
d27a09f75997b032e5e6dcb59d2e8d50714f1db5dfb12e4d46693b3c19b84bca
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_branch %}
master
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

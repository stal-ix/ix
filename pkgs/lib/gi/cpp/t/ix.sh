{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
72da39cd81f9fc83005e4b0430ac40b870adea4e18aff04c42fab91a6584c9ed
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
70b0e3d522cec60316d116dcbd919b797e85685a
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

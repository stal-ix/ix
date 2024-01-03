{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
057257f2c9fe3bcbf693f337c6043c9dfacdb59303f897e6b3557ab5d7a5041b
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
d86b6ab9969e453c1e2caa5b77d0d93380c40c59
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

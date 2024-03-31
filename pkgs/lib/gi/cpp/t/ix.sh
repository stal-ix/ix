{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
55fc4a4296cca0fe2921d9ff097f7bed0c8976312cc33230d764655da09cad73
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

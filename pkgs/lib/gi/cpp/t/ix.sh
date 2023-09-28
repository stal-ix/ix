{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
33730c785e274f0f354ecd2e7b1d497982d7bfe1ac0783100553a7fae60111ed
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_commit %}
d4849109daa597dfb5a25aed3e0d3018237d67d2
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

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v3.11.0.tar.gz
sha:e0c4fbd03c0bb7e99b40791e0276be61e5f531106e1486e8f0d771a7ed6d754a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
JSON_BuildTests=OFF
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/include/nlohmann/json_fwd.hpp
#pragma once
#include <nlohmann/json.hpp>
EOF
{% endblock %}

{% extends '//lib/json/nlohmann/t/ix.sh' %}

{% block pkg_name %}
json
{% endblock %}

{% block version %}
3.12.0
{% endblock %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4b92eb0c06d10683f7447ce9406cb97cd4b453be18d7279320f7b2f025c10187
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/include/nlohmann/json_fwd.hpp
#pragma once
#include <nlohmann/json.hpp>
EOF
{% endblock %}

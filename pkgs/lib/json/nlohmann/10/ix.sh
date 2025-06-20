{% extends '//lib/json/nlohmann/t/ix.sh' %}

# noauto

{% block pkg_name %}
json
{% endblock %}

{% block version %}
3.10.5
{% endblock %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5daca6ca216495edf89d167f808d1d03c4a4d929cef7da5e10f135ae1540c7e4
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/include/nlohmann/json_fwd.hpp
#pragma once
#include <nlohmann/json.hpp>
EOF
{% endblock %}

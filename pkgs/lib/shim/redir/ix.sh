{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include/{{from | dirname}}
cat << EOF > ${out}/include/{{from}}
#pragma once
#include <{{to}}>
EOF
{% endblock %}

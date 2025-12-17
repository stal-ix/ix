{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/include/{{from | dirname}}
cat << EOF > ${out}/include/{{from}}
#pragma once
#include <{{to}}>
EOF
{% endblock %}

{% block env %}
{{super()}}
export IX_{{from.replace('/', '_').replace('-','_').replace('.', '_').upper()}}_DIR=${out}
{% endblock %}

{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_DECODER=ON
ENABLE_ENCODER=ON
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|-lstdc++||g'      \
    -e 's|-L@libdir@||'     \
    -e 's|-I@includedir@||' \
    -i libde265.pc.in
{% endblock %}

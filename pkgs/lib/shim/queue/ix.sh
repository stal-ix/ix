{% extends '//die/std/ix.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block install %}
mkdir -p ${out}/include/sys; cd ${out}/include/sys

base64 -d << EOF > queue.h
{% include 'queue.h/base64' %}
EOF

base64 -d << EOF > cdefs.h
{% include 'cdefs.h/base64' %}
EOF
{% endblock %}

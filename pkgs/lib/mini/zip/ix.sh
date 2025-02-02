{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include '//lib/z/adler/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/z/adler
{% endblock %}

{% block unpack %}
{{super()}}
cd contrib/minizip
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include 'zlib-1.2.8-minizip-include.patch/base64' %}
EOF
{% endblock %}

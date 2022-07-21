{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/0.21.1/libpsl-0.21.1.tar.gz
sha:ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}

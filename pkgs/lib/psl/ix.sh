{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/0.21.1/libpsl-0.21.1.tar.gz
ad40b970dcb5117d559b62a1e0d8d827
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}

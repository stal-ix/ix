{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v1.2.4.tar.gz
sha:b48da42b9750f149704eb6dbd60ab80b28c5b0d7aaf7e9de75dd9aab585e8e9a
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols
{% endblock %}

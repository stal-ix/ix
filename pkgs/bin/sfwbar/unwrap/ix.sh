{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/LBCrion/sfwbar/archive/refs/tags/v1.0_beta9.tar.gz
sha:ad4e2599c34703298871511e013b183d2c9b6f3c42e75d8a7514fae162ba07b3
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/json/c
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

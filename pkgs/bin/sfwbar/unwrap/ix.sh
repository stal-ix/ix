{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/LBCrion/sfwbar/archive/refs/tags/v1.0_beta13.tar.gz
sha:06abcfbdf1c0d1e547cdf5110a8b58f2997bbc243d350c2a3e02f70120ee0c5a
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/json/c
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block version %}
0.2.0
{% endblock %}

{% block pkg_name %}
wmenu
{% endblock %}

{% block fetch %}
https://codeberg.org/adnano/wmenu/archive/{{self.version().strip()}}.tar.gz
4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/pango
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block version %}
1.8.0
{% endblock %}

{% block pkg_name %}
kanshi
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/kanshi/-/archive/v{{self.version().strip()}}/kanshi-v{{self.version().strip()}}.tar.bz2
8a65921458e1ff7e5368d6911538b8c2b432ed0ac4884db7abcca90ca0528853
{% endblock %}

{% block bld_libs %}
lib/c
lib/scfg
lib/varlink
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

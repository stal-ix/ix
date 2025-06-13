{% extends '//die/c/meson.sh' %}

{% block version %}
1.7.0
{% endblock %}

{% block pkg_name %}
kanshi
{% endblock %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/archive/v{{self.version().strip()}}.tar.gz
d35b2a0b41a36cc55066320ae7ae5b176450546a4ed67ee09e7241ecd36bfc73
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

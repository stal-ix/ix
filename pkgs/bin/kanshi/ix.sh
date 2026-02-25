{% extends '//die/c/meson.sh' %}

{% block version %}
1.9.0
{% endblock %}

{% block pkg_name %}
kanshi
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/kanshi/-/archive/v{{self.version().strip()}}/kanshi-v{{self.version().strip()}}.tar.bz2
96b4988e50b6c359bb31354500a4197e5978d804a50b6e7144a695a154c700b9
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

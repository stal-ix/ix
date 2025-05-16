{% extends '//die/c/meson.sh' %}

{% block version %}
0.4.0
{% endblock %}

{% block pkg_name %}
wlsunset
{% endblock %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/wlsunset/archive/{{self.version().strip()}}.tar.gz
sha:a86ffb1793fe622802ec25795b69df864715986ecc175f7734e739c9e264ed72
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

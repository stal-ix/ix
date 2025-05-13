{% extends '//die/c/meson.sh' %}

{% block version %}
0.2.0
{% endblock %}

{% block pkg_name %}
wlsunset
{% endblock %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/wlsunset/archive/{{self.version().strip()}}.tar.gz
sha:88bce695722a09d79545f14d404cc0659f7176bb08d5db5f4f23228b6ba8bb03
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

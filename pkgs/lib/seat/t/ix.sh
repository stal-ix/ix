{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
seatd
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/{{self.version().strip()}}.tar.gz
819979c922a0be258aed133d93920bce6a3d3565a60588d6d372ce9db2712cd3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/scdoc
{% endblock %}

{% block meson_flags %}
{% if stalix %}
defaultpath=/var/run/seatd/seatd.sock
{% endif %}
{% endblock %}

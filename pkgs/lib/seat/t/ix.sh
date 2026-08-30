{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
seatd
{% endblock %}

{% block version %}
0.9.3
{% endblock %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/{{self.version().strip()}}.tar.gz
302564d54d8e28191fadfd734f2675ecb0c9e0615a58011b89ef15dfa4dbaa96
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

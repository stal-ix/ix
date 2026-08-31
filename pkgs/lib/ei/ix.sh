{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libei
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/{{self.version().strip()}}/libei-{{self.version().strip()}}.tar.bz2
5ed6078fa63afd554cc04b1001675615da0ed8fe23b80492ab63403140b5a830
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/evdev
lib/xkb/common
{% endblock %}

{% block bld_libs %}
pip/attrs
pip/jinja2
lib/kernel
{% endblock %}

{% block c_rename_symbol %}
strv_from_string
strv_join
{% endblock %}

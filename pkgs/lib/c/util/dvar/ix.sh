{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-dvar
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-dvar/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e4b0661e29611eccccbca122f91e9c0cb161e8c44382f80a77f1b95a0007c264
{% endblock %}

{% block lib_deps %}
lib/c/util/utf8
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-dvar
{% endblock %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-dvar/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fa4b697532b6c56929106747eabd8cde792a280aa18883b2507037905e7547df
{% endblock %}

{% block lib_deps %}
lib/c/util/utf8
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

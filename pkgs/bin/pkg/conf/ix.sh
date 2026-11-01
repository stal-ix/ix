{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.10
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
11818a25f2730132f3b258ac8be4e82f83b9db03a1a99a6c29cd01b94fc9d310
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

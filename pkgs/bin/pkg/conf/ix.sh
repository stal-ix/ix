{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.8
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
44f67cdda8192efecd9be9f8df2fe54f087f8c84062ddff0027133f94543bf8a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

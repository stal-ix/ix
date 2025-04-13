{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gzip
{% endblock %}

{% block version %}
1.14
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gzip/gzip-{{self.version().strip()}}.tar.xz
sha:01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

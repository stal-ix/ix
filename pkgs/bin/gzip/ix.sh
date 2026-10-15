{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gzip
{% endblock %}

{% block version %}
1.15
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gzip/gzip-{{self.version().strip()}}.tar.xz
9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
tar
{% endblock %}

{% block version %}
1.35
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/tar/tar-{{self.version().strip()}}.tar.xz
sha:4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/intl
lib/iconv
lib/bzip/2
{% endblock %}

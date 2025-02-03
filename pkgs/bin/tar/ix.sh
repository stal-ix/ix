{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/tar/tar-1.35.tar.xz
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

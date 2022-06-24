{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
9a08d29a9ac4727130b5708347c0f5cf
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/intl
lib/iconv
lib/bzip/2
{% endblock %}

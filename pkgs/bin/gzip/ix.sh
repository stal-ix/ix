{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.xz
sha:7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-4.0.41.tar.lz
sha:e0425e206c1d7faebf9c151d1b55c66385e05af752266525602ce3cd2779c9f9
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.18.tar.gz
sha:3b08f5f4f9b4eb82f151a7040bfd6fe6c6fb922efe4b1659c66ea933276965e8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

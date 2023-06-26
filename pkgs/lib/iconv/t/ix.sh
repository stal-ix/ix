{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.17.tar.gz
sha:8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

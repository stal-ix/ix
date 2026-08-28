{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libiconv
{% endblock %}

{% block version %}
1.19
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/libiconv/libiconv-{{self.version().strip()}}.tar.gz
88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

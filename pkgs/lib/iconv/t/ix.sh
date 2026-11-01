{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libiconv
{% endblock %}

{% block version %}
1.19.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/libiconv/libiconv-{{self.version().strip()}}.tar.gz
9a06844846d664d7122161700c10a64480d7c7bcead3091925a785b38c91edab
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

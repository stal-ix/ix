{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libwpd
{% endblock %}

{% block version %}
0.10.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpd/libwpd/libwpd-{{self.version().strip()}}/libwpd-{{self.version().strip()}}.tar.xz
2465b0b662fdc5d4e3bebcdc9a79027713fb629ca2bff04a3c9251fdec42dd09
{% endblock %}

{% block lib_deps %}
lib/c
lib/c
lib/boost
lib/revenge
{% endblock %}

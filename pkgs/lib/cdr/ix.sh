{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcdr
{% endblock %}

{% block version %}
0.1.8
{% endblock %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libcdr/libcdr-{{self.version().strip()}}.tar.xz
sha:ced677c8300b29c91d3004bb1dddf0b99761bf5544991c26c2ee8f427e87193c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/boost
lib/lcms/2
lib/revenge
{% endblock %}

{% block configure_flags %}
--without-docs
--disable-werror
--disable-tests
{% endblock %}

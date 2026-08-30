{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
librevenge
{% endblock %}

{% block version %}
0.0.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpd/librevenge/librevenge-{{self.version().strip()}}/librevenge-{{self.version().strip()}}.tar.xz
19eacf5ce55d7fe6a990a45142589cdf7da0c7b68701797f133482cb44f189fa
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/boost
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-tests
{% endblock %}

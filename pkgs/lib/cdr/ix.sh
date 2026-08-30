{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcdr
{% endblock %}

{% block version %}
0.1.9
{% endblock %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libcdr/libcdr-{{self.version().strip()}}.tar.xz
f7bb6abdd7f226820f288a93dd8d07759833c0250d9e202af90f9b312c4665a3
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

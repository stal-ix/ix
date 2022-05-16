{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://dev-www.libreoffice.org/src/libcdr/libcdr-0.1.7.tar.xz
sha:5666249d613466b9aa1e987ea4109c04365866e9277d80f6cd9663e86b8ecdd4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/lcms2
lib/boost
lib/revenge
{% endblock %}

{% block bld_tool %}
bin/doxygen
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-tests
{% endblock %}

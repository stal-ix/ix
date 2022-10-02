{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.1.1.tar.gz
sha:785edab622a1bc7e25e1537ad2c325005d48c5c7957f7abedff405deb80fa59a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/jpeg
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
WERROR=OFF
{% endblock %}

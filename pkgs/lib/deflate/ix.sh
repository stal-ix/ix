{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.17.tar.gz
sha:fa4615af671513fa2a53dc2e7a89ff502792e2bdfc046869ef35160fcc373763
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}

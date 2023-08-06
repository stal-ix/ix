{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://jugit.fz-juelich.de/mlz/libcerf/-/archive/v2.4/libcerf-v2.4.tar.bz2
sha:6084ee75f7035690fc193a8b298bc87f6446b5e19f20544690c171a5094fe76c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIB_MAN=OFF
LIB_RUN=OFF
{% endblock %}

{% block patch %}
sed -e 's|add_sub.*test.*||' -i CMakeLists.txt
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
exiv2
{% endblock %}

{% block version %}
0.28.5
{% endblock %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e1671f744e379a87ba0c984617406fdf8c0ad0c594e5122f525b2fb7c28d394d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/expat
lib/brotli
{% endblock %}

{% block cmake_flags %}
EXIV2_ENABLE_INIH=OFF
EXIV2_ENABLE_BMFF=ON
EXIV2_BUILD_SAMPLES=OFF
EXIV2_ENABLE_DYNAMIC_RUNTIME=OFF
EXIV2_TEAM_WARNINGS_AS_ERRORS=OFF
{% endblock %}

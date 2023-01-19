{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v0.27.6.tar.gz
sha:f16ee5ff08b6994c66106109417857f13e711fca100ac43c6a403d4f02b59602
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/expat
{% endblock %}

{% block cmake_flags %}
EXIV2_ENABLE_BMFF=ON
EXIV2_BUILD_SAMPLES=OFF
EXIV2_TEAM_WARNINGS_AS_ERRORS=OFF
{% endblock %}

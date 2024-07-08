{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v0.27.6.tar.gz
sha:f16ee5ff08b6994c66106109417857f13e711fca100ac43c6a403d4f02b59602
#broken darktable
#https://github.com/Exiv2/exiv2/archive/refs/tags/v0.28.3.tar.gz
#sha:1315e17d454bf4da3cc0edb857b1d2c143670f3485b537d0f946d9ed31d87b70
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

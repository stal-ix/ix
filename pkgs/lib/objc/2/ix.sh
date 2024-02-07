{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/refs/tags/v2.2.tar.gz
sha:c4c5cede579949249f16736c9b1f85c58c44addb013f59970dcb566d9069152a
{% endblock %}

{% block cmake_flags %}
TESTS=OFF
ENABLE_OBJCXX=OFF
tls-robin-map_FOUND=ON
{% endblock %}

{% block lib_deps %}
lib/c
lib/robin/map
{% endblock %}

{% block patch %}
sed -e 's|.*hidden.*__vector_base_common.*||' -i arc.mm
{% endblock %}

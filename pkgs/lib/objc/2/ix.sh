{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libobjc2
{% endblock %}

{% block version %}
2.3
{% endblock %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5ead2276b42a534ac40437ce53b2231320b985539dc325453d93874be8d92869
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

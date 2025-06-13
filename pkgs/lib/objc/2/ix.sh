{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libobjc2
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
768ea8c5bd0999a29b5d15781125494f986456c1dc5c51d370fb31852cd31ea1
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

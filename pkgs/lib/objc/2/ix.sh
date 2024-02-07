{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/gnustep/libobjc2
{% endblock %}

{% block git_branch %}
v2.2
{% endblock %}

{% block git_sha %}
e404f9a3172992ea48ef41a94c4dc1e1b3dfa09ead929fd607318cd58ca25d1a
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

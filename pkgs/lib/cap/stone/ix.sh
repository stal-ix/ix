{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0.2
{% endblock %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9d0be727cc942075a1696f576b88918eb0daf9db7a02f563f0c4e51a439a611d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CAPSTONE_BUILD_TESTS=OFF
CAPSTONE_BUILD_SHARED=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version: .*|Version: {{self.version().strip()}}|' \
    -e 's|archs=.*||' \
    -i ${out}/lib/pkgconfig/capstone.pc
{% endblock %}

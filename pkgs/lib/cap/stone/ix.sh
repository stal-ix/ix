{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0.3
{% endblock %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3970c63ca1f8755f2c8e69b41432b710ff634f1b45ee4e5351defec4ec8e1753
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

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capstone
{% endblock %}

{% block version %}
5.0.7
{% endblock %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/{{self.version().strip()}}.tar.gz
6427a724726d161d1e05fb49fff8cd0064f67836c04ffca3c11d6d859e719caa
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

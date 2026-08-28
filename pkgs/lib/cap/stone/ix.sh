{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capstone
{% endblock %}

{% block version %}
5.0.9
{% endblock %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/{{self.version().strip()}}.tar.gz
0619da31af08152600af95c481527ef6d756c0a8404fca7544a4fdf6dfc2c0f9
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

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
capstone
{% endblock %}

{% block version %}
5.0.6
{% endblock %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/{{self.version().strip()}}.tar.gz
240ebc834c51aae41ca9215d3190cc372fd132b9c5c8aa2d5f19ca0c325e28f9
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

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/5.0-rc2.tar.gz
sha:869d94813a887329bc11b4bf1f4410a7a2b7f270176439e90b158127d5a215dd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CAPSTONE_BUILD_TESTS=OFF
CAPSTONE_BUILD_SHARED=OFF
{% endblock %}

{% block patch %}
cat << EOF >> CMakeLists.txt
install(FILES \${CMAKE_BINARY_DIR}/capstone.pc DESTINATION \${CMAKE_INSTALL_LIBDIR}/pkgconfig)
EOF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version: ..|Version: 5.0|' -i ${out}/lib/pkgconfig/capstone.pc
{% endblock %}

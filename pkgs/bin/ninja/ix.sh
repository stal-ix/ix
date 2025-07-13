{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ninja
{% endblock %}

{% block version %}
1.13.1
{% endblock %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f0055ad0369bf2e372955ba55128d000cfcc21777057806015b45e4accbebf23
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/re2c
{% endblock %}

{% block patch %}
# fix riscv64 build
sed -e 's|.*CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE.*||' -i CMakeLists.txt
{% endblock %}

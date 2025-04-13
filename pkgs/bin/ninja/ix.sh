{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ninja
{% endblock %}

{% block version %}
1.12.1
{% endblock %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:821bdff48a3f683bc4bb3b6f0b5fe7b2d647cf65d52aeb63328c91a6c6df285a
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

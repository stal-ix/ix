{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ninja
{% endblock %}

{% block version %}
1.13.0
{% endblock %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f08641d00099a9e40d44ec0146f841c472ae58b7e6dd517bee3945cfd923cedf
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

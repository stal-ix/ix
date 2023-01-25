{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v1.11.1.tar.gz
sha:31747ae633213f1eda3842686f83c2aa1412e0f5691d1c14dbbcc67fe7400cea
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

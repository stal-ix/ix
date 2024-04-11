{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v1.12.0.tar.gz
sha:8b2c86cd483dc7fcb7975c5ec7329135d210099a89bc7db0590a07b0bbfe49a5
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

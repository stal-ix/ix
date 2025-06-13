{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ls-qpack
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b6c91e8974876c69788fbb7d84c5d49a9a3c932c168fe353261923c742d3d635
{% endblock %}

{% block lib_deps %}
lib/c
lib/xxhash
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*LINK.*XXH.*||' \
    -i ${out}/lib/cmake/ls-qpack/ls-qpack-config.cmake
sed -e 's|.*LINK.*XXH.*||' \
    -i ${out}/lib/cmake/ls-qpack/ls-qpack-targets.cmake
{% endblock %}

{% block cmake_flags %}
LSQPACK_BIN=OFF
LSQPACK_XXH=OFF
{% endblock %}

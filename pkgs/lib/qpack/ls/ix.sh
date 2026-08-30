{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ls-qpack
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1c55c3ec956cdfcfa0b90b5e24dbeb41d35c83f8be823b3c0afb0c33967b6d4c
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

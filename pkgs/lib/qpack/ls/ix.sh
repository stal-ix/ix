{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ls-qpack
{% endblock %}

{% block version %}
2.6.2
{% endblock %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
db1a83102bb7d2d946a910cb11a9d69c1c5b9fd9a40249c22c411fb9c429fe16
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

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ls-qpack
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/litespeedtech/ls-qpack/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:567a7a86f801eef5df28ce0cc89826d9008a57135027bdf63ba4a1d0639d0c58
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
{% endblock %}

{% block cmake_flags %}
LSQPACK_BIN=OFF
LSQPACK_XXH=OFF
{% endblock %}

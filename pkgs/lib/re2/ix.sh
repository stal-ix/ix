{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2024-04-01.tar.gz
sha:3f6690c3393a613c3a0b566309cf04dc381d61470079b653afc47c67fb898198
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
RE2_BUILD_TESTING=OFF
{% endblock %}

{% block env %}
export CMFLAGS="-Dre2_DIR=${out}/lib/cmake/re2 -Dre2_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e "s|.*re2_INCLUDE_DIR.*|set(re2_INCLUDE_DIR ${out}/include)|" \
    -i ${out}/lib/cmake/re2/re2Config.cmake
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2023-08-01.tar.gz
sha:d82d0efe2389949244445e7a6ac9a10fccc3d6a3d267ec4652991a51291647b0
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
export CMFLAGS="-Dre2_DIR=${out}/lib/cmake/re2 \${CMFLAGS}"
{% endblock %}

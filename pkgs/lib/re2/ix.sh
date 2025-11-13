{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2
{% endblock %}

{% block version %}
2025-11-05
{% endblock %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/{{self.version().strip().replace('.', '-')}}.tar.gz
87f6029d2f6de8aa023654240a03ada90e876ce9a4676e258dd01ea4c26ffd67
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

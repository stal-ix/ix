{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ngtcp2
{% endblock %}

{% block version %}
1.15.1
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1119e0c661cda5234cf6c3b9cbd17a16081730df18d5d0484c97e4a407dc6a97
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/ng/http/3
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_STATIC_LIB=OFF
ENABLE_SHARED_LIB=ON
{% endblock %}

{% block patch %}
{{super()}}
>examples/CMakeLists.txt
>third-party/CMakeLists.txt
{% endblock %}

{% block env %}
export COFLAGS="--with-ngtcp2=${out} \${COFLAGS}"
{% endblock %}

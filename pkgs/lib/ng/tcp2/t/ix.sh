{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ngtcp2
{% endblock %}

{% block version %}
1.13.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:207c0daea888ae35092cd4762606adc2289a054cb4aae893cca8953cfa011442
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

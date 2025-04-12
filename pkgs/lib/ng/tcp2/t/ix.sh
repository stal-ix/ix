{% extends '//die/c/cmake.sh' %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:144b169aa98ba2ca1f74cf40ff5e93b90a7bb1292f62b7998a8dd5c2a5eb102a
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

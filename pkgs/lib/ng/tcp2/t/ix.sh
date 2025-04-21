{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ngtcp2
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:21c565e32b6b0094df282915722833fbf1ad0b1b136b6e7d55740b5368138cc8
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

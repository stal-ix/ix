{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
epoll-shim
{% endblock %}

{% block version %}
0.0.20240608
{% endblock %}

{% block fetch %}
https://github.com/jiixyj/epoll-shim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8f5125217e4a0eeb96ab01f9dfd56c38f85ac3e8f26ef2578e538e72e87862cb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ALLOWS_ONESHOT_TIMERS_WITH_TIMEOUT_ZERO_EXITCODE=ON
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/libdata/* ${out}/lib/
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libepoll-shim \${CPPFLAGS}"
{% endblock %}

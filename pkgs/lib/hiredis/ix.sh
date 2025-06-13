{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hiredis
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
25cee4500f359cf5cad3b51ed62059aadfc0939b05150c1f19c7e2829123631c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
DISABLE_TESTS=ON
{% endblock %}

{% block env %}
export COFLAGS="--with-hiredis=${out} --with-libhiredis=${out} \${COFLAGS}"
{% endblock %}

{% block test %}
test -d ${out}/lib/cmake/hiredis
{% endblock %}

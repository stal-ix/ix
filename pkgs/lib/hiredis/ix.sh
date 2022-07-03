{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v1.0.2.tar.gz
sha:e0ab696e2f07deb4252dda45b703d09854e53b9703c7d52182ce5a22616c3819
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/lib/cmake
mv ${out}/share/hiredis ${out}/lib/cmake/
{% endblock %}

{% block env %}
export COFLAGS="--with-hiredis=${out} --with-libhiredis=${out} \${COFLAGS}"
{% endblock %}

{% extends '//mix/template/proxy.sh' %}

{% block lib_deps %}
lib/wolfssl/mix.sh
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
{% endblock %}

{% block build %}
>empty.c
gcc -c empty.c -o empty.o
ar q libcrypto.a empty.o
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libcrypto.a ${out}/lib/
{% endblock %}

{% block env %}
export CPPFLAGS="-I${lib_wolfssl}/include/wolfssl \${CPPFLAGS}"
{% endblock %}

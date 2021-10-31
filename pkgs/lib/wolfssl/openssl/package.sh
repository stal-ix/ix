{% extends '//mix/template/proxy.sh' %}

{% block deps %}
# lib lib/wolfssl/package.sh
# bld env/std/package.sh
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

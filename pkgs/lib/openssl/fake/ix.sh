{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_tool %}
bld/genpc
{% endblock %}

{% block build %}
>empty.c
clang -c empty.c -o empty.o
ar q libempty.a empty.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib/pkgconfig
cp libempty.a ${out}/lib/libcrypto.a
cp libempty.a ${out}/lib/libssl.a
genpc "openssl" "1.1.1"
{% endblock %}

{% block env %}
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=${out} \${COFLAGS}"
{% endblock %}

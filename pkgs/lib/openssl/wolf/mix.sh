{% extends '//mix/c_std.sh' %}

{% block lib_deps %}
lib/c
lib/wolfssl
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
cp -R ${lib_wolfssl}/include/wolfssl ${out}/include

{{hooks.gen_pc('openssl', '1.1.1')}}
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=${out} \${COFLAGS}"
{% endblock %}

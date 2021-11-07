{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.openssl.org/source/openssl-3.0.0.tar.gz
43c5ab628b7ab899d7cd4a4c7fe4067f
{% endblock %}

{% block bld_deps %}
{{'lib/linux/mix.sh' | linux}}
dev/build/make/mix.sh
dev/lang/perl5/mix.sh
env/std/mix.sh
{% endblock %}

{% block setup %}
export AR=ar
export RANLIB=ranlib
{% endblock %}

{% block configure %}
{% set openssl_conf_opts %}
{% block openssl_conf_opts %}
{% endblock %}

no-asm
threads
no-shared
no-dso
no-tests

--prefix="${out}"
--openssldir="${out}"
{% endset %}

PLATFORM_darwin_arm64="darwin64-arm64-cc"
PLATFORM_darwin_x86_64="darwin64-x86_64-cc"
PLATFORM_linux_x86_64="linux-x86_64-clang"

PLATFORM=${PLATFORM_{{mix.platform.target.os}}_{{mix.platform.target.arch}}}

perl ./Configure ${PLATFORM} {{mix.fix_list(openssl_conf_opts)}}
{% endblock %}

{% block env %}
export SSL_DIR="${out}"
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=$out \${COFLAGS}"
{% endblock %}

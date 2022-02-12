{% extends '//mix/make.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block setup %}
export AR=ar
export RANLIB=ranlib
{% endblock %}

{% block make_install_target %}
install_sw
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
--openssldir={% block openssl_cert_dir %}"${OPENSSL_CERT_DIR}"{% endblock %}
{% endset %}

PLATFORM_darwin_arm64="darwin64-arm64-cc"
PLATFORM_darwin_x86_64="darwin64-x86_64-cc"
PLATFORM_linux_x86_64="linux-x86_64-clang"

perl ./Configure \
    ${PLATFORM_{{target.os}}_{{target.arch}}} \
    {{mix.fix_list(openssl_conf_opts)}}
{% endblock %}

{% block env_lib %}
export SSL_DIR="${out}"
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=$out \${COFLAGS}"
{% endblock %}

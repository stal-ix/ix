{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.4.tar.xz
sha:2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/gmp
lib/zstd
lib/idn/2
lib/tasn1
lib/nettle
lib/brotli
lib/unbound
{% if linux %}
lib/seccomp
{% endif %}
{% if darwin %}
lib/darwin/framework/Security
{% endif %}
lib/unistring
{% endblock %}

{% block bld_libs %}
lib/shim/gnu
{% endblock %}

{% block use_data %}
aux/ca/bundle
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block c_rename_symbol %}
# conflict with libunbound
verbose
rawmemchr
{% endblock %}

{% block configure_flags %}
--with-default-trust-store-file=${CA_BUNDLE}
{% if darwin %}
--disable-hardware-acceleration
{% endif %}
--disable-tests
--without-p11-kit
{% endblock %}

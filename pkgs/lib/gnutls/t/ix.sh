{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.0.tar.xz
sha:0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gmp
lib/idn/2
lib/tasn1
lib/nettle
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
aux/ca-bundle
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block c_rename_symbol %}
# conflict with libunbound
verbose
rawmemchr
{% endblock %}

{% block setup %}
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}

{% block configure_flags %}
--with-default-trust-store-file=${CA_BUNDLE}
{% if darwin %}
--disable-hardware-acceleration
{% endif %}
--disable-tests
--without-p11-kit
{% endblock %}

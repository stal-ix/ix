{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.7.tar.xz
sha:be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106
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

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block c_rename_symbol %}
# conflict with libunbound
verbose
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

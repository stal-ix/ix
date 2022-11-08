{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.8.tar.xz
sha:c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114
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

{% block bld_data %}
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

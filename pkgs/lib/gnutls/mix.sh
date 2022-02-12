{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz
95c32a1af583ecfcb280648874c0fbd9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/gmp
lib/idn/2
lib/tasn1
lib/nettle
lib/unbound
{% if target.os == 'linux' %}
lib/seccomp
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/Security
{% endif %}
lib/unistring
{% endblock %}

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block c_rename_symbol %}
# conflict with libunbound
verbose
{% endblock %}

{% block configure_flags %}
--with-default-trust-store-file=${CA_BUNDLE}
{% if target.os == 'darwin' %}
--disable-hardware-acceleration
{% endif %}
--disable-tests
--without-p11-kit
{% endblock %}

{% block patch %}
{% if target.os == 'linux' %}
cat << EOF > src/gl/error.h
#include_next <error.h>
EOF
{% endif %}
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}

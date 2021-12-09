{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz
95c32a1af583ecfcb280648874c0fbd9
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
lib/gmp/mix.sh
lib/idn/2/mix.sh
lib/tasn1/mix.sh
lib/nettle/mix.sh
lib/unbound/mix.sh
{% if target.os == 'linux' %}
lib/seccomp/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/Security/mix.sh
{% endif %}
lib/unistring/mix.sh
{% endblock %}

{% block setup %}
# conflict with libunbound
export CPPFLAGS="-Dverbose=gnutls_verbose ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
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

{% block env %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz
95c32a1af583ecfcb280648874c0fbd9
{% endblock %}

{% block lib_deps %}
lib/cxx/mix.sh
lib/gmp/mix.sh
lib/idn2/mix.sh
lib/tasn1/mix.sh
lib/nettle/mix.sh
{% if mix.platform.target.os == 'linux' %}
lib/seccomp/mix.sh
{% endif %}
lib/unistring/mix.sh
{% endblock %}

{% block bld_deps %}
gnu/which/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--disable-tests
--without-p11-kit
{% endblock %}

{% block patch %}
cat << EOF > src/gl/error.h
#include_next <error.h>
EOF
{% endblock %}

{% block env %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}

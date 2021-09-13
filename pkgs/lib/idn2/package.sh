{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/libidn/libidn2-2.3.1.tar.gz
# md5 cda07f5ac55fccfafdf7ee01828adad5
{% endblock %}

{% block deps %}
# lib lib/intl lib/iconv lib/unistring
# bld dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block cflags %}
{% if mix.platform.target.os == 'darwin' %}
export CPPFLAGS="-Derror=idna2_error ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lidn2 \${LDFLAGS}"
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}

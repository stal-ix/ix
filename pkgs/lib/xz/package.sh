{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://tukaani.org/xz/xz-5.2.5.tar.xz
# md5 aa1621ec7013a19abab52a8aff04fe5b
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv dev/build/make env/tools env/c env/bootstrap
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -llzma \${LDFLAGS}"
export COFLAGS="--with-lzma=${out} \${COFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
{% endblock %}

{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://github.com/curl/curl/releases/download/curl-7_79_1/curl-7.79.1.tar.xz
# md5 74d3c4ca8aaa6c0619806d6e246e65fb
{% endblock %}

{% block deps %}
# lib lib/z lib/c-ares lib/idn2 lib/zstd lib/brotli lib/nghttp2 lib/openssl
# lib {{'sys/framework/SystemConfiguration' | darwin}}
# bld dev/doc/groff dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block coflags %}
--enable-manual
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lcurl \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
export CMFLAGS="-DCURL_LIBRARY=${out}/lib/libcurl.a -DCURL_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

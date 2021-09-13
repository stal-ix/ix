{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://github.com/curl/curl/releases/download/curl-7_78_0/curl-7.78.0.tar.xz
# md5 419c2461366cf404160a820f7a902b7e
{% endblock %}

{% block deps %}
# lib lib/z lib/idn2 lib/zstd lib/brotli lib/nghttp2 lib/openssl
# lib {{'sys/framework/SystemConfiguration' | darwin}}
# bld dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block cflags %}
export LIBS=$(echo "${LDFLAGS}" | tr ' ' '\n' | grep '^-l' | tr '\n' ' ')
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lcurl \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-DCURL_LIBRARY=${out}/lib/libcurl.a -DCURL_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

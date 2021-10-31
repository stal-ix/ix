{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/curl/curl/releases/download/curl-7_79_1/curl-7.79.1.tar.xz
# md5 74d3c4ca8aaa6c0619806d6e246e65fb
{% endblock %}

{% block deps %}
# lib lib/z/package.sh
# lib lib/c-ares/package.sh
# lib lib/idn2/package.sh
# lib lib/zstd/package.sh
# lib lib/brotli/package.sh
# lib lib/nghttp2/package.sh
# lib lib/openssl/package.sh
# lib {{'sys/framework/SystemConfiguration/package.py' | darwin}}
# bld dev/doc/groff/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--enable-manual
{% endblock %}

{% block env %}
export CMFLAGS="-DCURL_LIBRARY=${out}/lib/libcurl.a -DCURL_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

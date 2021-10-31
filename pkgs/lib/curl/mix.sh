{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/curl/curl/releases/download/curl-7_79_1/curl-7.79.1.tar.xz
# md5 74d3c4ca8aaa6c0619806d6e246e65fb
{% endblock %}

{% block deps %}
# lib lib/z/mix.sh
# lib lib/c-ares/mix.sh
# lib lib/idn2/mix.sh
# lib lib/zstd/mix.sh
# lib lib/brotli/mix.sh
# lib lib/nghttp2/mix.sh
# lib lib/openssl/mix.sh
# lib {{'sys/framework/SystemConfiguration/package.py' | darwin}}
# bld dev/doc/groff/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block coflags %}
--enable-manual
{% endblock %}

{% block env %}
export CMFLAGS="-DCURL_LIBRARY=${out}/lib/libcurl.a -DCURL_INCLUDE_DIR=${out}/include \${CMFLAGS}"
{% endblock %}

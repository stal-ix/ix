{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://nodejs.org/dist/v18.13.0/node-v18.13.0.tar.gz
sha:61ae68446438c2479e466d551b6e8c898097d56722957b1a8466ec8476a590d2
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/xz
lib/icu
lib/c++
lib/kernel
lib/c/ares
lib/brotli
lib/openssl
lib/ng/http/2
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block bld_tool %}
bin/gyp
bin/procps/ng
bin/python/huge
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}

--shared-zlib
--shared-libuv
--shared-cares
--shared-brotli
--shared-nghttp2
--shared-openssl

--without-npm
--with-intl=system-icu

--experimental-http-parser
{% endblock %}

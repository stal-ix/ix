{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://nodejs.org/dist/v23.4.0/node-v23.4.0.tar.gz
sha:1abc3d7ed398b0fd8606837552732f7bebce0cd2285069477d0692d318442248
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

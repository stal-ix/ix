{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://nodejs.org/dist/v16.16.0/node-v16.16.0.tar.gz
sha:e07c30b0498f143c08793e34bda1adeaad32f485a4f79f4d67a82879f4c0bbe3
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/xz
lib/icu
lib/c++
lib/linux
lib/c/ares
lib/brotli
lib/openssl
lib/ng/http/2
lib/shim/atomic
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

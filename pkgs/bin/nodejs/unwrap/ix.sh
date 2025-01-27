{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://nodejs.org/dist/v23.6.0/node-v23.6.0.tar.gz
sha:9cd2aaa44d7d658833bb03ab4ce4c57273ba4c9b716094c931c709e6948fd71d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/xz
lib/icu
lib/c++
lib/dlfcn
lib/kernel
lib/c/ares
lib/brotli
lib/openssl
lib/simd/json
lib/ng/http/2
lib/ng/http/3
lib/ng/tcp2/openssl
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block bld_tool %}
bin/gyp
bin/procps/ng
bin/python/huge
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}

--use_clang

--shared-zlib
--shared-libuv
--shared-cares
--shared-brotli
--shared-ngtcp2
--shared-nghttp2
--shared-nghttp3
--shared-openssl
--shared-simdjson

--without-npm
--with-intl=system-icu
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% extends '//die/c/configure.sh' %}

{% block version %}
23.9.0
{% endblock %}

{% block fetch %}
https://nodejs.org/dist/v{{self.version().strip()}}/node-v{{self.version().strip()}}.tar.gz
sha:164ec8fe82aac21f74efc0d5890d9f6c0e0ba22ca285d400c0266913fb4ff8a0
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

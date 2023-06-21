{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://nodejs.org/dist/v18.16.1/node-v18.16.1.tar.gz
sha:518f4c8dc23a26d8df77288d94e254b6015d792026ff9ba0c2316af255875fa5
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

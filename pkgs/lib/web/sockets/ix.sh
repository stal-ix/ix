{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libwebsockets
{% endblock %}

{% block version %}
4.3.5
{% endblock %}

{% block fetch %}
https://github.com/warmcat/libwebsockets/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:87f99ad32803ed325fceac5327aae1f5c1b417d54ee61ad36cffc8df5f5ab276
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/uv
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block c_flags %}
-Wno-implicit-int-conversion
{% endblock %}

{% block cmake_flags %}
LWS_IPV6=ON
LWS_WITH_LIBUV=ON
LWS_WITH_SHARED=OFF
LWS_WITH_EVLIB_PLUGINS=OFF
LWS_WITHOUT_TESTAPPS=ON
LWS_WITHOUT_TEST_CLIENT=ON
LWS_WITHOUT_TEST_PING=ON
LWS_WITHOUT_TEST_SERVER=ON
LWS_WITHOUT_TEST_SERVER_EXTPOLL=ON
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|websockets_shared|websockets|' -i ${out}/lib/cmake/libwebsockets/libwebsockets-config.cmake
{% endblock %}

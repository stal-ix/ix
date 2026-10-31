{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libwebsockets
{% endblock %}

{% block version %}
5.1.0
{% endblock %}

{% block fetch %}
https://github.com/warmcat/libwebsockets/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9acbba00aaa9e6178ae09c6f920d95449b527c1417e81d2cdd4103bc6d64d13f
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
-Wno-sign-compare
{% endblock %}

{% block cmake_flags %}
LWS_IPV6=ON
LWS_WITH_HTTP3=OFF
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

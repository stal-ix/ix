{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/LadybirdBrowser/ladybird
{% endblock %}

{% block git_commit %}
bce7b24cfb86ba1b8a253d999e5bcc9d330cba6b
{% endblock %}

{% block git_sha %}
9440057cdb4d21d483d9db504a0b61cd9a4fdb3db8405d4a80c33f506b1a2180
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*ENABLE_PUBLIC_SUFFIX.*||' \
    -i Userland/Libraries/LibWebView/CMakeLists.txt
sed -e 's|.*find.*unoff.*||' \
    -e 's|unofficial::skia::skia||' \
    -i Userland/Libraries/LibWeb/CMakeLists.txt
sed -e 's|explicit StringBuilder|StringBuilder|' -i AK/StringBuilder.h
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/skia
lib/woff2
lib/execinfo
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/multimedia
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
ENABLE_QT=ON
CMAKE_INSTALL_DATADIR=share
ENABLE_COMMONMARK_SPEC_DOWNLOAD=OFF
ENABLE_PUBLIC_SUFFIX_DOWNLOAD=OFF
ENABLE_CACERT_DOWNLOAD=OFF
ENABLE_ADOBE_ICC_PROFILES_DOWNLOAD=OFF
ENABLE_TIME_ZONE_DATABASE_DOWNLOAD=OFF
ENABLE_UNICODE_DATABASE_DOWNLOAD=OFF
{% endblock %}

{% block build %}
>${tmp}/obj/Lagom/cacert.pem
{{super()}}
{% endblock %}

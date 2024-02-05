{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/keepassxreboot/keepassxc/releases/download/2.7.6/keepassxc-2.7.6-src.tar.xz
sha:a58074509fa8e90f152c6247f73e75e126303081f55eedb4ea0cbb6fa980d670
https://raw.githubusercontent.com/orsonteodoro/oiledmachine-overlay/master/app-admin/keepassxc/files/keepassxc-2.7.6-qt6-support.patch
sha:0814865e9273223a33c22548850c38fbe49a9fff561a7a032a5be0236e44f0af
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/botan
lib/argon2
lib/qrencode
lib/qt/6/base
lib/qt/6/deps
lib/key/utils
lib/qt/6/compat
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
WITH_TESTS=OFF
WITH_XC_X11=OFF
WITH_XC_AUTOTYPE=OFF
WITH_XC_UPDATECHECK=OFF
WITH_XC_DOCS=OFF
WITH_QT6=ON
WITH_QT5=OFF
{% endblock %}

{% block patch %}
ulimit -n 10000
patch -p1 --fuzz 10 < ${src}/keepassxc-2.7.6-qt6-support.patch
sed -e 's|.*QXcbIntegrationPlugin.*||' -i src/main.cpp
>src/core/Alloc.cpp
{% endblock %}

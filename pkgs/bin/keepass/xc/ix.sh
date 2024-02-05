{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/varjolintu/keepassxc
{% endblock %}

{% block git_commit %}
be87c0fc06ca61fcc6151e615e6e519f084f5360
{% endblock %}

{% block git_sha %}
8bb8316b066f512f97ffd8aaa143b2b1f602df649a7f071be3caf37d7fa6460c
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
{% endblock %}

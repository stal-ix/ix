{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/SerenityOS/serenity
{% endblock %}

{% block git_commit %}
c87e32154aac3a8942a44927f996887c398165fb
{% endblock %}

{% block git_sha %}
0815fcabd1b77d6c2bbcfeb82b27d6ef23a4138fe0878ffdfdb95fd34566baff
{% endblock %}

{% block step_unpack %}
{{super()}}
sed -e 's|.*ENABLE_PUBLIC_SUFFIX.*||' \
    -i Userland/Libraries/LibWebView/CMakeLists.txt
cd Ladybird
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
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

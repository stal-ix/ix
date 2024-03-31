{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block git_repo %}
https://github.com/SerenityOS/serenity
{% endblock %}

{% block git_commit %}
78def34c5e721ccacbfa19f5eeb27405da50dc23
{% endblock %}

{% block git_sha %}
c8f997ecd7ec813983276a6682c70eb5b0f3a150d9b2704724dcb0aebe85a8eb
{% endblock %}

{% block git_refine %}
rm Base/usr/bin/env
rm Base/bin/more
find . -type l -delete
{% endblock %}

{% block step_unpack %}
{{super()}}
cd Ladybird
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
ENABLE_TIME_ZONE_DATABASE_DOWNLOAD=OFF
ENABLE_UNICODE_DATABASE_DOWNLOAD=OFF
{% endblock %}

{% block patch %}
chmod +x ../Userland/Libraries/LibWeb/Scripts/GenerateStyleSheetSource.sh
{% endblock %}

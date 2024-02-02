{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block git_repo %}
https://github.com/SerenityOS/serenity
{% endblock %}

{% block git_commit %}
78def34c5e721ccacbfa19f5eeb27405da50dc23
{% endblock %}

{% block git_sha %}
fd0cfa9fc9eaf6c642c893f7abed6444f63c5f4451d5ddc5be42f13ca6e5caa0
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

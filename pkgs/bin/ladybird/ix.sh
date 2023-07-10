{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block git_repo %}
https://github.com/SerenityOS/serenity
{% endblock %}

{% block git_commit %}
78def34c5e721ccacbfa19f5eeb27405da50dc23
{% endblock %}

{% block git_sha %}
b55fc4146a5d000d412bbeed68794d681281ba211be3a6486c82d250471a995c
{% endblock %}

{% block unpack %}
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

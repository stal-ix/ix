{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block git_repo %}
https://github.com/SerenityOS/serenity
{% endblock %}

{% block git_commit %}
78def34c5e721ccacbfa19f5eeb27405da50dc23
{% endblock %}

{% block git_sha %}
bbea03a262d45619cb2512f27bacbdbaf3c2ede72473b1cad5eec9c71d3fc24b
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

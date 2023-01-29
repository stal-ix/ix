{% extends '//die/c/cmake.sh' %}

{# WIP #}

{% block fetch %}
https://github.com/SerenityOS/serenity/archive/78def34c5e721ccacbfa19f5eeb27405da50dc23.zip
sha:f35f89fb67b856955d4cd593d2de5e20716bb0fe44a3584bde79157a3b69fb31
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

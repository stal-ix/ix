{% extends '//die/autohell.sh' %}

{# WIP #}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.1.1-oss/poedit-3.1.1.tar.gz
sha:8b918a907773cda3fb450e247f3fabec2e221165eab933f1c1269ffc3863a204
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
lib/intl
lib/boost
lib/pugixml
lib/lucene++
lib/wx/widgets
lib/json/nlohmann
{% endblock %}

{% block bld_tool %}
bin/wxrc
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.2.1-oss/poedit-3.2.1.tar.gz
sha:a68ceceb0e3b10b714fe2d80f179b7737c1baf88f50e86e62b32079a88246b57
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
lib/intl
lib/boost
lib/secret
lib/pugixml
lib/lucene++
lib/gtk/spell
lib/wx/widgets
lib/json/nlohmann
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block bld_tool %}
bin/wxrc
{% endblock %}

{% block patch %}
sed -e 's|.*m_content.*||' -i src/fileviewer.cpp
sed -e 's|webview,||' -i configure.ac
{% endblock %}

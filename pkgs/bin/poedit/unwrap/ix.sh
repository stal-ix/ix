{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.3.1-oss/poedit-3.3.1.tar.gz
sha:4a8af5c37be152ebab012ebf5c7e21aec3e3c692be34deaf00c78216e901b926
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
lib/json/nlohmann/11
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block bld_tool %}
bin/wxrc
{% endblock %}

{% block patch %}
sed -e 's|.*m_content.*||' -i src/fileviewer.cpp
sed -e 's|webview,||' -i configure.ac
{% endblock %}

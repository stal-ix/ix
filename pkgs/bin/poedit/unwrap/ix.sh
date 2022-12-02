{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.2.2-oss/poedit-3.2.2.tar.gz
sha:d87c1a80a885fd348a6d031bdc7daaa0aa5bc59922db564bef9c6dc49243cdde
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

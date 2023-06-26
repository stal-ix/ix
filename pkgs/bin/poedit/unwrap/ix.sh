{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.3.2-oss/poedit-3.3.2.tar.gz
sha:e64139dd4beac1b8ea468d351b2b4bdae8ecbc6f4ca5d1ee1c73832036fff097
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

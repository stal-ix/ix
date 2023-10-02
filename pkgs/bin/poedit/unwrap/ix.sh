{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v3.4-oss/poedit-3.4.tar.gz
sha:b1eaf919a77057bf9d18c643efb64909fe6b32d49d189ecfa953165a3517398c
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

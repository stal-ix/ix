{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
poedit
{% endblock %}

{% block version %}
3.4.3
{% endblock %}

{% block fetch %}
https://github.com/vslavik/poedit/releases/download/v{{self.version().strip()}}-oss/poedit-{{self.version().strip()}}.tar.gz
ed37b8dee466ae5c4d8312391398d9b5c17933562e40691c881de17111d7f61e
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

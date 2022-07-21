{% extends '//die/c/autorehell.sh' %}

{# compile error with current wx  #}

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

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('poedit')}}
{% endblock %}

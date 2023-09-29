{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtcharts/archive/refs/tags/v6.5.3.tar.gz
sha:ca53e795abd1200df0c472a6c7fb77db6c3db4aa927d1b4124bae0addfb230f3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/multimedia
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

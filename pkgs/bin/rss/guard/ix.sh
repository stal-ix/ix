{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
rssguard
{% endblock %}

{% block version %}
4.8.6
{% endblock %}

{% block fetch %}
https://github.com/martinrotter/rssguard/archive/refs/tags/{{self.version().strip()}}.tar.gz
c29bdda08ece8de113dbdb87e8e23491221ba9ddbacd26141d6a00e04888972e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/multimedia
lib/qt/6/declarative
lib/qt/6/declarative/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
NO_LITE=OFF
FORCE_BUNDLE_ICONS=ON
ENABLE_MEDIAPLAYER_LIBMPV=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

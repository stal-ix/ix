{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
libqtxdg
{% endblock %}

{% block version %}
4.5.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/{{self.version().strip()}}.tar.gz
58e862b54e80053abc4d1e941e525fc03745a487fffb996b88764ff8849e410b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/svg
lib/qt/6/base
{% endblock %}

{% block c_rename_symbol %}
ScalableEntry
PixmapEntry
QIconCacheGtkReader
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
QTXDG_DEFAPPS_CONF_INSTALL_DIR=${out}/share/xdg
{% endblock %}

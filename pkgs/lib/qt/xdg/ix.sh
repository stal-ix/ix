{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
libqtxdg
{% endblock %}

{% block version %}
4.1.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:23015b9a834ecec6b67a96fb06297d6c7496cbb58b4b70183e101c7a92db7ed3
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

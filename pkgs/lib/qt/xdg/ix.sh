{% extends '//die/c/lxqt.sh' %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/4.0.1.tar.gz
sha:4adb3f1c7ee0d7f1ad53dab8a79a3916a23fb8b902c8fb2f5c02ec8a4be1547b
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

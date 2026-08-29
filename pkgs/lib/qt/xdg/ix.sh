{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
libqtxdg
{% endblock %}

{% block version %}
4.4.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/{{self.version().strip()}}.tar.gz
1e59690f5e74b2a23ec91564e8c5d03baffa8a3c6243d935c0f299a54d2e44ea
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

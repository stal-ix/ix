{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
libqtxdg
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/{{self.version().strip()}}.tar.gz
15925adba9deba7859557f995a57b2caa1e7425f4da4e67ce148608d65ecf6f9
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

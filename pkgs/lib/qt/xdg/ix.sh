{% extends '//die/c/lxqt.sh' %}

{% block fetch %}
https://github.com/lxqt/libqtxdg/archive/refs/tags/4.0.0.tar.gz
sha:edf12d8e6fe1292e842cdf01e57cc882754846e8c7d1212cc02f953c71f28d12
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

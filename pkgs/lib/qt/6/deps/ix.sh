{% extends '//die/premain.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/qt/6/svg
lib/qt/6/base
lib/drivers/3d
lib/qt/6/wayland
lib/qt/6/imageformats
{% endblock %}

{% block premain_lang %}c++ -std=c++20{% endblock %}

{% block premain_code %}
#include <QtCore/QtPlugin>

Q_IMPORT_PLUGIN(QTlsBackendOpenSSL)
Q_IMPORT_PLUGIN(QWebpPlugin)
Q_IMPORT_PLUGIN(QJpegPlugin)
Q_IMPORT_PLUGIN(QGifPlugin)
Q_IMPORT_PLUGIN(QComposePlatformInputContextPlugin)
Q_IMPORT_PLUGIN(QSvgIconPlugin)
Q_IMPORT_PLUGIN(QIbusPlatformInputContextPlugin)
Q_IMPORT_PLUGIN(QWaylandIntegrationPlugin)
Q_IMPORT_PLUGIN(QWaylandEglPlatformIntegrationPlugin)
Q_IMPORT_PLUGIN(QWaylandEglClientBufferPlugin)
Q_IMPORT_PLUGIN(QWaylandXdgShellIntegrationPlugin)
Q_IMPORT_PLUGIN(QWaylandBradientDecorationPlugin)
{% endblock %}

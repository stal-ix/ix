{% extends '//lib/qt/6/wayland/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_wayland_client=OFF
QT_FEATURE_wayland_server=OFF
{% endblock %}

{% block postinstall %}
cd ${out}
mv lib old
mkdir -p lib/cmake
mv old/cmake/Qt6WaylandScannerTools lib/cmake/
rm -rf doc include plugins modules old
{% endblock %}

{% block env %}
export Qt6WaylandScannerTools_DIR=${out}/lib/cmake/Qt6WaylandScannerTools
{% endblock %}

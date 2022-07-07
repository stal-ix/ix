{% extends '//lib/qt/6/wayland/t/ix.sh' %}

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

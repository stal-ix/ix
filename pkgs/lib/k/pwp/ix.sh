{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
plasma-wayland-protocols
{% endblock %}

{% block version %}
1.23.0
{% endblock %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-{{self.version().strip()}}.tar.xz
16c5ad917bde2ed795942dacba76654819ddc6a1566842325ef34e0b553ef138
{% endblock %}

{% block lib_deps %}
lib/k/ecm
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PlasmaWaylandProtocols_DIR="${out}/share/cmake/PlasmaWaylandProtocols"
{% endblock %}

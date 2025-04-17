{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
plasma-wayland-protocols
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-{{self.version().strip()}}.tar.xz
sha:cbd44b440e6b7cc76b650da93a870897e5a94adf7882b19fdf8fe222d4f74a4f
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
export PlasmaWaylandProtocols_DIR="${out}/lib/cmake/PlasmaWaylandProtocols"
{% endblock %}

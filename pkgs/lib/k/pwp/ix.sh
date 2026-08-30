{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
plasma-wayland-protocols
{% endblock %}

{% block version %}
1.21.0
{% endblock %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-{{self.version().strip()}}.tar.xz
698a7b28b711270314e396e248ae86087cfeaed01372009063995be6e1dc85ba
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

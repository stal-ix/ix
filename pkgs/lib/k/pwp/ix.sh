{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
plasma-wayland-protocols
{% endblock %}

{% block version %}
1.18.0
{% endblock %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-{{self.version().strip()}}.tar.xz
sha:2567472671ad5d989f88b51baef9dd59353a5e7c3f2ed7e6b989755cb9004233
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

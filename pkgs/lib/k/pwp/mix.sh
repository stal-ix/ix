{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-1.6.0.tar.xz
sha:b74ffac969ef067e47180e748a67a3a1816b7157ff4ea620ed4432f59b70f01f
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

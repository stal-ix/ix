{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-1.7.0.tar.xz
sha:084e2685caa61d94c6fe86dce006b22474d7bb4b34c4cb96bd763b97e305fad6
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

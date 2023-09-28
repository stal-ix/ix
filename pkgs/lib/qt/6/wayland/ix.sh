{% extends 't/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6/wayland
bld/qt/6/tools/qml
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_wayland_compositor_quick=ON
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
zwp_linux_dmabuf_v1_interface
zwp_linux_buffer_params_v1_interface
{% endblock %}

{% block patch %}
:
{% endblock %}

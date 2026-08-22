{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_meson %}
bld/system
{% else %}
bld/cmake
bld/python
{% if native %}
bld/meson/unwrap(std_box=bld/boot/box)
{% else %}
bld/meson/unwrap
{% endif %}
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/cmake
bld/python
{% if native %}
bld/meson/unwrap(std_box=bld/boot/box)
{% else %}
bld/meson/unwrap
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/cmake
bld/python
bld/meson/unwrap(std_box=bld/boot/box)
{% endblock %}

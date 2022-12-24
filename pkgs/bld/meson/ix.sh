{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bin/meson/ix(std_box=bld/boot/box)
{% endblock %}

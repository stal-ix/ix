{% extends '//mix/hub.sh' %}

{% block run_deps %}
bld/python
bin/meson/better(std_box=bld/boot/box)
{% endblock %}

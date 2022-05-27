{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/cctools(std_box=bld/boot/box)
{% endblock %}

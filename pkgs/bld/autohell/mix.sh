{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/autohell/full(std_box=bld/boot/box)
{% endblock %}

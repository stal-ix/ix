{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/texinfo/unwrap(std_box=bld/boot/box)
{% endblock %}

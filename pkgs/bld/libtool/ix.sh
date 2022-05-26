{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/libtool(std_box=bld/boot/box)
{% endblock %}

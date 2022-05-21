{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bash/lite(std_box=bld/boot/box)
{% endblock %}

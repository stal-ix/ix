{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/minigzip/gzip(std_box=bld/boot/box)
{% endblock %}

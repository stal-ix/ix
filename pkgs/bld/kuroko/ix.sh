{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kuroko/lite(std_box=bld/boot/box)
{% endblock %}

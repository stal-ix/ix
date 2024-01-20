{%extends '//die/hub.sh' %}

{% block run_deps %}
bin/nasm(std_box=bld/boot/box)
{% endblock %}

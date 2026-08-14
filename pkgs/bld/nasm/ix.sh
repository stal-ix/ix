{%extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_nasm %}
bld/system
{% else %}
bin/nasm(std_box=bld/boot/box)
{% endif %}
{% endblock %}

{%extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/nasm(std_box=bld/system/box,libc_lite=1)
{% elif system_nasm %}
bld/system
{% else %}
bin/nasm(std_box=bld/boot/box)
{% endif %}
{% endblock %}

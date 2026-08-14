{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_libtool %}
bld/system
{% elif native %}
bin/libtool(std_box=bld/boot/box)
{% else %}
bin/libtool
{% endif %}
{% endblock %}

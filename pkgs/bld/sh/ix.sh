{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_sh %}
bld/system
{% elif native %}
bin/dash/sh(std_box=bld/boot/box)
{% else %}
bin/dash/lite/sh
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_cctools %}
bld/system
{% elif darwin %}
bin/cctools(std_box=bld/boot/box)
{% else %}
bin/cctools
{% endif %}
{% endblock %}

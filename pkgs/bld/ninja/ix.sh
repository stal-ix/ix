{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_ninja %}
bld/system
{% elif native %}
bin/ninja(std_box=bld/boot/box)
{% else %}
bin/ninja
{% endif %}
{% endblock %}

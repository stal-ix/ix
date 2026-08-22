{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_m4 %}
bld/system
{% elif native %}
bin/m4/19(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/m4/19(intl_ver=no)
{% endif %}
{% endblock %}

{%extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_box %}
bld/system
{% elif native %}
bld/box/unwrap(std_box=bld/boot/box,intl_ver=no)
{% else %}
bld/box/unwrap(intl_ver=no)
{% endif %}
{% endblock %}

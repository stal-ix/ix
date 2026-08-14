{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_flex %}
bld/system
{% else %}
bld/m4
{% if native %}
bld/flex/native(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/flex(intl_ver=no)
{% endif %}
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_make %}
bld/system
{% elif native %}
bin/make/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/make(intl_ver=no)
{% endif %}
{% endblock %}

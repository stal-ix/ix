{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_cmake %}
bld/system
{% elif native %}
bin/cmake/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/cmake/lite(intl_ver=no)
{% endif %}
{% endblock %}

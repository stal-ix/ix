{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_python %}
bld/system
{% elif native %}
bin/python/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/python/12(intl_ver=no)
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_re2c %}
bld/system
{% elif native %}
bin/re2c(std_box=bld/boot/box)
{% else %}
bin/re2c
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_byacc %}
bld/system
{% elif native %}
bin/byacc/yacc(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/byacc/yacc(intl_ver=no)
{% endif %}
{% endblock %}

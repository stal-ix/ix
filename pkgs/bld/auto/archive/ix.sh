{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_auto_archive %}
bld/system
{% elif native %}
bin/auto/conf/archive(std_box=bld/boot/box)
{% else %}
bin/auto/conf/archive
{% endif %}
{% endblock %}

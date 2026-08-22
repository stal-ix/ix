{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/auto/conf/archive(std_box=bld/system/box,libc_lite=1)
{% elif system_auto_archive %}
bld/system
{% elif native %}
bin/auto/conf/archive(std_box=bld/boot/box)
{% else %}
bin/auto/conf/archive
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/libtool(std_box=bld/system/box,libc_lite=1)
{% elif system_libtool %}
bld/system
{% elif native %}
bin/libtool(std_box=bld/boot/box)
{% else %}
bin/libtool
{% endif %}
{% endblock %}

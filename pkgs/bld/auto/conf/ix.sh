{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/auto/conf/{{conf_ver or '2/69'}}(std_box=bld/system/box,libc_lite=1)
{% elif system_autoconf %}
bld/system
{% elif conf_ver %}
bin/auto/conf/{{conf_ver}}
{% elif native %}
bin/auto/conf/2/69(std_box=bld/boot/box)
{% else %}
bin/auto/conf/2/69
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bld/auto(conf_ver=2/71,std_box=bld/system/box,libc_lite=1)
{% elif system_auto_python %}
bld/system
{% elif native %}
bld/auto(conf_ver=2/71,std_box=bld/boot/box)
{% else %}
bld/auto(conf_ver=2/71)
{% endif %}
{% endblock %}

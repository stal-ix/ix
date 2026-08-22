{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/auto/make/{{make_ver or '1/16/5'}}(std_box=bld/system/box,libc_lite=1)
{% elif system_automake %}
bld/system
{% elif make_ver %}
bin/auto/make/{{make_ver}}
{% elif native %}
bin/auto/make/1/16/5(std_box=bld/boot/box)
{% else %}
bin/auto/make/1/16/5
{% endif %}
{% endblock %}

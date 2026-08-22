{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_perl %}
bld/system
{% elif native %}
bin/perl/host(std_box=bld/boot/box,libgdbm_ver=boot,sdk_target=10.15)
{% else %}
bin/perl(sdk_target=10.15)
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/m4
bin/flex(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

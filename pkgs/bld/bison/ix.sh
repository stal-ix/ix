{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/m4
bin/bison/3/7(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

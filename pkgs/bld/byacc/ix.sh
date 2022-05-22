{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/byacc/yacc(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bin/glib/codegen(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

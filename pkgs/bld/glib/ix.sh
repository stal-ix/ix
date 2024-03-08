{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
pip/packaging
bin/glib/codegen(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

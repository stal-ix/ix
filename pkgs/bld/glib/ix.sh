{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
pip/packaging
{% if native %}
bin/glib/codegen(std_box=bld/boot/box,intl_ver=stub)
{% else %}
bin/glib/codegen(intl_ver=stub)
{% endif %}
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/glib/codegen(std_box=bld/system/box,intl_ver=stub,libc_lite=1)
{% elif system_glib %}
bld/system
{% else %}
bld/python
pip/packaging
{% if native %}
bin/glib/codegen(std_box=bld/boot/box,intl_ver=stub)
{% else %}
bin/glib/codegen(intl_ver=stub)
{% endif %}
{% endif %}
{% endblock %}

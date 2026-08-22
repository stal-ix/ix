{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_pkg_config %}
bld/system
{% elif native %}
bin/pkg/config(std_box=bld/boot/box,intl_ver=stub,libglib_ver=host)
{% else %}
bin/pkg/config(intl_ver=stub)
{% endif %}
{% endblock %}

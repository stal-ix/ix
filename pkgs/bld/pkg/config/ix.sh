{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/pkg/config(std_box=bld/boot/box,intl_ver=stub,libglib_ver=host)
{% endblock %}

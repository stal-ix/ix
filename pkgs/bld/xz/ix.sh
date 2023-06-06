{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xz(std_box=bld/boot/box,intl_ver=no)
{% endblock %}

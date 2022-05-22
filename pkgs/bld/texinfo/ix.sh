{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/texinfo(std_box=bld/boot/box,intl_ver=no,curses=no)
{% endblock %}

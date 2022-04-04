{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/texinfo(std_box=bld/bootbox,intl_ver=no,curses=netbsd)
{% endblock %}

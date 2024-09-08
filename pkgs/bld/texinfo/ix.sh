{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/fake/er(tool_name=texinfo)
bld/fake/er(tool_name=makeinfo)
#bin/tex/info(std_box=bld/boot/box,intl_ver=no,curses=no)
{% endblock %}

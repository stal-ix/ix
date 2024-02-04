{% extends '//die/hub.sh' %}

{% block run_deps %}
# https://forums.gentoo.org/viewtopic-t-1141876.html
bld/fake/er(tool_name=help2man)
{% endblock %}

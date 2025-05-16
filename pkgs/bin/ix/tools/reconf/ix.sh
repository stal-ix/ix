{% extends '//die/hub.sh' %}

{% block run_deps %}
set/menuconfig
bin/ix/tools/reconf/scripts
{% endblock %}

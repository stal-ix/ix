{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ya/tools/wrapper
bin/ya/final/unwrap(ya_boot_tc=bin/ya/final/0)
{% endblock %}

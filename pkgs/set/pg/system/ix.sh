{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/tmpfs
set/stalix
bin/kernel/6/8
bin/kernel/gengrub
{% endblock %}

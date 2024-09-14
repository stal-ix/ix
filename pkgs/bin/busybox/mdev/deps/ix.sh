{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox
bin/busybox/mdev/conf
{% endblock %}

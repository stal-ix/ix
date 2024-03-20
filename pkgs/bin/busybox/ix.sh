{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/busybox/ix(purec=uclibc/ng,libc=uclibc/ng)
{% endblock %}

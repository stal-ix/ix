{% extends '//die/hub.sh' %}

{% block run_deps %}
etc/core
bin/setcwd
etc/concat
bin/busybox
bin/iwd/ctl
etc/user/root
bin/sud/client
bin/sud/scripts
{% endblock %}

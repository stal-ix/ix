{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
etc/concat
bin/busybox
bin/iwd/ctl
bin/sud/client
bin/sud/scripts
set/enclave/etc
{% endblock %}

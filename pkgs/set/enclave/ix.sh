{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/setcwd
etc/concat
bin/iwd/ctl
bin/dash/sh
bin/sud/client
bin/sud/scripts
set/enclave/etc
bin/bsdutils/env
set/enclave/helpers
{% endblock %}

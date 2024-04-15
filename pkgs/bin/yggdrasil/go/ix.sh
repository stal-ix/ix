{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/yggdrasil/go/ctl
bin/yggdrasil/go/daemon
bin/yggdrasil/go/genkeys
{% endblock %}

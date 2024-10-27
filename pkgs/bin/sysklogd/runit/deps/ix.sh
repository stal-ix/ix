{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/sysklogd
bin/sysklogd/runit/deps/conf
{% endblock %}

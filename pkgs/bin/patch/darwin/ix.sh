{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/patch/darwin/unwrap(buildtype=asserts)
{% endblock %}

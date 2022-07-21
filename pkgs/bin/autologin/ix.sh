{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/subreaper
bin/autologin/runit
{% endblock %}

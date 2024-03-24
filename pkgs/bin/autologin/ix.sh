{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/fixtty
bin/subreaper
bin/autologin/runit(srv_dir=autologin_{{slot}})
{% endblock %}

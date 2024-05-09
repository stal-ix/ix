{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/tmux
bin/kakoune/unwrap
bin/kakoune/scripts
{% endblock %}

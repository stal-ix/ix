{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/tmux
bin/kakoune/scripts
bin/kakoune/unwrap(libcplpl_ver=17,opt=O2)
{% endblock %}

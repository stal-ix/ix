{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/heirloom/lex(std_env=bld/boot/8/env/cxx)
{% endblock %}

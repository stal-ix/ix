{% extends '//die/hub.sh' %}

{% block pkg_name %}
codex-wrap
{% endblock %}

{% block run_deps %}
bin/codex/wrap/scripts
bin/wrap
bin/codex
{% endblock %}

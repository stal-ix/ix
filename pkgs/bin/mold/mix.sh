{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mold/unwrap(cplpl_std=exp)
{% endblock %}

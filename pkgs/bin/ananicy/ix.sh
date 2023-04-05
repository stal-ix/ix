{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ananicy/cpp(cplpl_std=15)
{% endblock %}

{% block run_data %}
bin/ananicy/good
{% endblock %}

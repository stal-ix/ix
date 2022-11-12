{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mrustc/mrustc
bin/mrustc/minicargo
{% endblock %}
